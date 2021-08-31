extends Node2D

onready var cam = $Camera
onready var text_feedback = $GameConcerto/ScoreTextSpawner

var scores : int = 0

const SCREENS = {
	"initial" : Vector2.ZERO,
	"game"    : Vector2(1280, 0),
	"ranking" : Vector2(2560, 0),
	"defeat"  : Vector2(1280, 720)
}

const POINT_VALUES = {
	"ok" : 50,
	"good" : 100,
	"perfect" : 200,
}

func _ready() -> void:
	Pause.set_pause_state(true)
	ControllView.stop_all_musics()
	$initial/VideoPlayer.play()


func _on_Button_play_game_pressed() -> void:
	if cam.get_cam_position() == SCREENS.initial:
		cam.set_cam_target(SCREENS.game)
		$GameConcerto/SpawnNote.start_game()
		$initial/VideoPlayer.stop()
		#Deixa o mouse invisivel
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_SpawnNote_update_scores(dist_note_panel) -> void:
	if dist_note_panel < 9:
		scores += POINT_VALUES.perfect
		text_feedback.show_feedback("+ Perfeito")
	elif dist_note_panel < 18:
		scores += POINT_VALUES.good
		text_feedback.show_feedback("+ Bom")
	else:
		scores += POINT_VALUES.ok
		text_feedback.show_feedback("+ Ok")
		
	$GameConcerto/Scores/label.text = "%05d" % scores

func end_game(result:bool) -> void:
	cam.stop_shake()
	$GameConcerto/SpawnNote.stop_spawn()
	$GameConcerto/SpawnNote.destroy_all_notes()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	
	if result:
		cam.set_cam_target(SCREENS.ranking)
		$Ranking/points.text = "%05d" % scores
	else:
		cam.set_cam_target(SCREENS.defeat)

func _on_Button_to_menu_pressed() -> void:
	ControllView._change_scene("res://Scenes/Menu/Menu.tscn", "fade")

func _on_Button_restart_pressed() -> void:
	ControllView._change_scene("res://Scenes/Minigame2/Minigame2.tscn", "fade")

func _on_VideoPlayer_finished() -> void:
	$initial/VideoPlayer.play()
