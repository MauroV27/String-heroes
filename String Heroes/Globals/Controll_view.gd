extends CanvasLayer

onready var animation = $Control/AnimationPlayer

var dialog_music = load("res://Assets/Sounds/Musics/musica da tela de fala.mp3")

var music_is_active : bool = false
var scene : String

func _change_scene(new_scene, anim) -> void:
	scene = new_scene
	animation.play(anim)

func _new_scene()-> void:
	var err = get_tree().change_scene(scene)
	if err != OK:
		print("A erro has ocorred in scene transition: " + scene)

func play_dialog_music() -> void:
	if not music_is_active:
		$music.stream = dialog_music
		$music.play()
		music_is_active = true

func stop_all_musics() -> void:
	$music.stop()
	music_is_active = false

func _on_music_finished() -> void:
	if music_is_active:
		$music.play()
