extends Control

onready var cam = $Camera
onready var fala1 = $Fala1/Dialog

const SCREENS = {
	"initial"	: Vector2(0,0),
	"fala1" 	: Vector2(1280, 0),
}

var arr = []
var count = 1

func _ready() -> void:
	arr = SCREENS.keys()

func _on_history_start_pressed() -> void:
	if cam.get_cam_position() == SCREENS.initial:
		fala1.start_dialog()
		cam.set_cam_target(SCREENS.fala1)

func _on_change_screen(next_scene:String) -> void:
	if next_scene == "tutorial1":
		ControllView._change_scene("res://Scenes/Minigame1/Minigame1.tscn", "fade")
