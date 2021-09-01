extends "res://Scenes/DialogBox/Dialog.gd"

var dialog_is_running : bool = true

signal change_screen(new_scene)
signal connect_with_puzzle_controller( dialog_is_running )

var default_panel_theme : Theme

func _ready() -> void:
#	default_panel_theme = $DialogBox.custom_styles
#	print( $DialogBox.get_stylebox_list("Panel"))
	pass
	
func start_dialog() -> void:
	set_process(true)
	next_phrase()
	$AnimationPlayer.play("start_popup")
	ControllView.stop_all_musics()

func _process(delta: float) -> void:
	$DialogBox/icon.visible = finished and dialog_is_running
	
	if finished and dialog_is_running:
		$DialogBox/AnimationPlayer.current_animation = animation_type
#		var finalized_theme = $DialogBox.get_stylebox("finalizedPanel")
#		$DialogBox.custom_styles = finalized_theme
		$DialogBox.get_stylebox("finalizedPanel")

func next_phrase() -> void:
	if phraseNum >= len(dialog):
		if next_screen != "":
			emit_signal("change_screen", next_screen)
			set_process(false)
		else:
			queue_free()
		return
	
	if not dialog_is_running:
		return
	
	finished = false
	
	$DialogBox.get_stylebox("defaultPanel") 
	
	$DialogBox/Character_icon.visible = true
	
	# Verifica se o texto pode ou não proseguir
	dialog_is_running = dialog[phraseNum]["continue"]
	
	emit_signal("connect_with_puzzle_controller", dialog_is_running)
	
	animation_type = "icon_move"
	
	$DialogBox/Text.bbcode_text = dialog[phraseNum]["text"] 
	$DialogBox/Text.visible_characters = 0
	
	while $DialogBox/Text.visible_characters < len($DialogBox/Text.text):
		$DialogBox/Text.visible_characters += 1
		
		$DialogBox/Timer.start()
		yield($DialogBox/Timer, "timeout")
	
	phraseNum += 1
	finished = true

func _on_PuzzleController_part_add() -> void:
	dialog_is_running = true
	next_phrase()
