extends Node2D

"""
	Controlador da segunda parte do modo história.
	Possui funções de ativação dos dialogos e do minigame 1
"""

onready var cam = $Camera

var SCREENS = {
	"initial" : Vector2.ZERO,
	"tutorial": Vector2(1280, 0),
	"game"    : Vector2(2560, 0),
	"end"	  : Vector2(3840, 0),
	"fala2"	  : Vector2(5120, 0),
}

func _ready() -> void:
	Pause.set_pause_state(true)
	$Initial/Dialog.start_dialog()
	$game/DialogPopup.connect("change_screen", self, "_change_screen")

func _on_Button_start_game_pressed() -> void:
	cam.set_cam_target(SCREENS.game)

func _on_Button_pressed() -> void:
	cam.set_cam_target(SCREENS.end)

func _on_Button_end_game_pressed() -> void:
	cam.set_cam_target(SCREENS.fala2)
	$Fala2/Dialog.start_dialog()

func _change_screen(new_scene) -> void:
	if new_scene == "tutorial":
		cam.set_cam_target(SCREENS.tutorial)
		ControllView.stop_all_musics()
#	if new_scene == "game":
#		cam.set_cam_target(SCREENS.game)
#		$game/DialogPopup.start_dialog()
#		$game/PuzzleController.start_game()
#		$game/music.play()
	if new_scene == "end":
		cam.set_cam_target(SCREENS.end)
#		$Final/DialogNovel.start_dialog()
		$game/music.stop()
	if new_scene == "next_scene":
		ControllView._change_scene("res://Scenes/Minigame2/Minigame2.tscn", "fade")

func _on_PuzzleController_game_complete() -> void:
#	cam.set_cam_target(SCREENS.end)
	pass

func _on_Button_menu_pressed() -> void:
	cam.set_cam_target(SCREENS.fala2)
	$game/music.stop()
	$Fala2/Dialog.start_dialog()

func _on_start_game_pressed() -> void:
	cam.set_cam_target(SCREENS.game)
	$game/DialogPopup.start_dialog()
	$game/PuzzleController.start_game()
	$game/music.play()
	$tutorial/VideoPlayer.stop()

func _on_VideoPlayer_finished() -> void:
	$tutorial/VideoPlayer.play()
