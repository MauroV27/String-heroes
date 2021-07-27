extends Node2D

onready var cam = $Camera

var scores : int = 0

const SCREENS = {
	"initial" : Vector2.ZERO,
	"game"    : Vector2(1280, 0),
	"ranking" : Vector2(2560, 0)
}

const POINT_VALUES = {
	"ok" : 5,
	"good" : 10,
	"perfect" : 20,
}

func _on_Button_play_game_pressed() -> void:
	if cam.get_cam_position() == SCREENS.initial:
		cam.set_cam_target(SCREENS.game)

func _on_SpawnNote_update_scores(dist_note_panel) -> void:
	if dist_note_panel < 5:
		scores += POINT_VALUES.perfect
		print("perfect")
	elif dist_note_panel < 10:
		scores += POINT_VALUES.good
		print("good")
	else:
		scores += POINT_VALUES.ok
		print("ok")
		
	$GameConcerto/Scores.text = "%05d" % scores
