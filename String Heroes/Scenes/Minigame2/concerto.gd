extends Node2D

onready var cam = $Camera

var scores : int = 0

const SCREENS = {
	"initial" : Vector2.ZERO,
	"game"    : Vector2(1280, 0),
	"ranking" : Vector2(2560, 0),
	"defeat"  : Vector2(1280, 720)
}

const POINT_VALUES = {
	"ok" : 5,
	"good" : 10,
	"perfect" : 20,
}

func _on_Button_play_game_pressed() -> void:
	if cam.get_cam_position() == SCREENS.initial:
		cam.set_cam_target(SCREENS.game)
		$GameConcerto/SpawnNote/Timer.start()

func _on_SpawnNote_update_scores(dist_note_panel) -> void:
	if dist_note_panel < 5:
		scores += POINT_VALUES.perfect
	elif dist_note_panel < 10:
		scores += POINT_VALUES.good
	else:
		scores += POINT_VALUES.ok
		
	$GameConcerto/Scores.text = "%05d" % scores

func end_game(result:bool) -> void:
	if result:
		cam.set_cam_target(SCREENS.ranking)
		$Ranking/points.text = "%05d" % scores
	else:
		cam.set_cam_target(SCREENS.defeat)

func _on_Button_to_menu_pressed() -> void:
	ControllView._change_scene("res://Scenes/Menu/Menu.tscn", "fade")

func _on_Button_restart_pressed() -> void:
	ControllView._change_scene("res://Scenes/Minigame2/Minigame2.tscn", "fade")
