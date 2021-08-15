extends CanvasLayer

var cam_pause_here : bool = false

func _ready() -> void:
	set_visible(false)
	if OS.get_name() != "HTML5":
		print("Não está rodando no HTML5.")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and cam_pause_here:
		set_visible( true )
		get_tree().paused = true

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

