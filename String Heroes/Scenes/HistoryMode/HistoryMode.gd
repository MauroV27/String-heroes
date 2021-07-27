extends Control

onready var cam = $Camera
onready var fala1 = $Fala1/Dialog

const SCREENS = {
	"initial"	: Vector2(0,0),
	"fala1" 	: Vector2(1280, 0),
	"tutorial1" : Vector2(1280, 720),
	"gamePuzzle": Vector2(1280, 1440),
	"congPuzzle": Vector2(2560, 1440),
	"fala2"		: Vector2(2560, 720),
	"tutorial2"	: Vector2(3840, 720),
	"game2"		: Vector2(3840, 1440),
	"congGame2"	: Vector2(3840, 2160)
}

#signal change_camera
var arr = []
var count = 1

func _ready() -> void:
	arr = SCREENS.keys()
	pass

func _input(event: InputEvent) -> void:
	# Codigo de debug feito apenas para mostrar o fluxo de telas
#	if Input.is_action_pressed("ui_accept") and count < arr.size():
#		var update_pos = SCREENS[arr[count]]
#		count += 1
#		if cam.get_cam_position() != update_pos:
#			cam.set_cam_target(update_pos)
	pass

func _on_history_start_pressed() -> void:
	if cam.get_cam_position() == SCREENS.initial:
		fala1.start_dialog()
		cam.set_cam_target(SCREENS.fala1)

func _on_change_screen(next_scene:String) -> void:
	print("Signal received in history mode to scene: " + next_scene)

#	var new_target = SCREENS[next_scene]
#	print(new_target, cam.cam_target)
#	cam.set_cam_target(new_target)
	if next_scene == "tutorial1":
		ControllView._change_scene("res://Scenes/Minigame1/Minigame1.tscn", "fade")
