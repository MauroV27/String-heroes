extends CanvasLayer

var cam_pause_here : bool = true
var audio_db_level : int = 5

func _ready() -> void:
	set_visible(false)
	if OS.get_name() == "HTML5":
		$Panel/Button_quit_game.queue_free()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and cam_pause_here:
		set_visible( true )
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func set_pause_state( new_state:bool ) -> void:
	cam_pause_here = new_state

func set_visible( is_visible:bool ) -> void:
	for node in get_children():
		node.visible = is_visible

func _on_Button_pause_over_pressed() -> void:
	get_tree().paused = false
	set_visible(false)

func _on_Button_menu_pressed() -> void:
	set_visible(false)
	ControllView._change_scene("res://Scenes/Menu/Menu.tscn", "fade")
	get_tree().paused = false

func _on_Button_quit_game_pressed() -> void:
	get_tree().quit()

func _on_Sound_controller_value_changed(value: float) -> void:
	#Pega o novo valor da variavel value e gera um valor em potencia de dois para os decibeis
	#Se tiver a baixo da metade ( menor que 5 ) diminui os decibeis, 
	#por conta disso é importante ter a função sing(value-5)
	audio_db_level = value
	var gloabal_audio_volume_db = sign(audio_db_level - 5) * pow(2, abs(audio_db_level - 5))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), gloabal_audio_volume_db)
