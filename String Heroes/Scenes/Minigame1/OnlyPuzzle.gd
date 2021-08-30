extends Control

onready var cam = $Camera

var SCREENS = {
	"initial" : Vector2.ZERO,
	"game"    : Vector2(1280, 0),
	"end"	  : Vector2(2560, 0),
}

func _ready() -> void:
	Pause.set_pause_state(true)

func _on_Button_jogar_pressed() -> void:
	cam.set_cam_target(SCREENS.game)
	$game/DialogPopup.start_dialog()
	$game/PuzzleController.start_game()
	$game/music.play()

func _on_Button_menu_pressed() -> void:
	ControllView._change_scene("res://Scenes/Menu/Menu.tscn", "fade")

func _on_change_screen(new_scene) -> void:
	if new_scene == "end":
		cam.set_cam_target(SCREENS.end)
		$game/music.stop()
