extends Control

onready var cam = $Camera

const SCREENS = {
	"initial" : Vector2.ZERO,
	"menu"    : Vector2(1280, 0),
	"credits" : Vector2(1280, 720),
	"loading" : Vector2(2560, 0)
}

func _ready() -> void:
	pass

func _on_Button_menu_pressed() -> void:
	cam.set_cam_target(SCREENS.menu)

func _on_Button_creditos_pressed() -> void:
	cam.set_cam_target(SCREENS.credits)

func _on_Button_puzzle_pressed() -> void:
	cam.set_cam_target(SCREENS.loading)

func _on_GameSelector_seletor_button_pressed(go_to_scene:PackedScene) -> void:
	cam.set_cam_target(SCREENS.loading)
	
	$Loading/Go_to.text = "mudando para outra cena"
#	var hist = "res://Scenes/HistoryMode/HistoryMode.tscn"
	if go_to_scene != null:
		ControllView._change_scene(go_to_scene.resource_path, "fade")
