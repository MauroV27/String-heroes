extends Control

onready var cam = $Camera

const SCREENS = {
	"initial" : Vector2.ZERO,
	"menu"    : Vector2(1280, 0),
	"credits" : Vector2(1280, 720),
	"loading" : Vector2(2560, 0)
}

func _ready() -> void:
#	CanvasLayer._change_music("res://Assets/Sounds/Musics/musica da tela inicial.mp3")
	$music_sound.play()

func _on_Button_menu_pressed() -> void:
	if cam.cam_target == SCREENS.initial:
#		CanvasLayer._change_music("res://Assets/Sounds/Musics/musica da tela de seleçao de jogo.mp3")
		$music_sound.stream = load("res://Assets/Sounds/Musics/musica da tela de seleçao de jogo.mp3")
		$music_sound.play()
	cam.set_cam_target(SCREENS.menu)
	$button_sound.play()

func _on_Button_creditos_pressed() -> void:
	cam.set_cam_target(SCREENS.credits)
	$button_sound.play()

func _on_GameSelector_seletor_button_pressed(go_to_scene:PackedScene) -> void:
	cam.set_cam_target(SCREENS.loading)
	
	$Loading/Go_to.text = "mudando para outra cena"
	
	if go_to_scene != null:
		ControllView._change_scene(go_to_scene.resource_path, "fade")
