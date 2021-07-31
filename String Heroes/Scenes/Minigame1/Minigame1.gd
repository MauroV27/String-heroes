extends Node2D

onready var cam = $Camera

var SCREENS = {
	"initial" : Vector2.ZERO,
	"game"    : Vector2(1280, 0),
	"end"	  : Vector2(2560, 0),
	"fala2"	  : Vector2(3840, 0),
}

func _ready() -> void:
	$Initial/Dialog.start_dialog()

func _on_Button_start_game_pressed() -> void:
	cam.set_cam_target(SCREENS.game)

func _on_Button_pressed() -> void:
	cam.set_cam_target(SCREENS.end)

func _on_Button_end_game_pressed() -> void:
	cam.set_cam_target(SCREENS.fala2)
	$Fala2/Dialog.start_dialog()

func _change_screen(new_scene) -> void:
	if new_scene == "game":
		cam.set_cam_target(SCREENS.game)
	if new_scene == "next_scene":
		ControllView._change_scene("res://Scenes/Minigame2/Minigame2.tscn", "fade")
