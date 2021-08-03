extends "res://Scenes/DialogBox/Dialog.gd"

var dialog_is_running : bool = true

signal change_screen(new_scene)

func _process(delta: float) -> void:
	$DialogBox/icon.visible = (finished and dialog_is_running)
	if finished and dialog_is_running:
		$DialogBox/AnimationPlayer.current_animation = animation_type

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
	
	var img = FILE_DIRECTORY + dialog[phraseNum]["character"] + "/icon/" + dialog[phraseNum]["image"]
	
	$DialogBox/Character_icon.visible = true
	$DialogBox/Character_icon.texture = load(img)
	dialog_is_running = dialog[phraseNum]["continue"]
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
