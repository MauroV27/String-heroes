extends Control
class_name DialogSystem

"""
	Código base para o sistema de dialogo do jogo.
	É usado nos scripts : DialogNovel.gd e DialogPopup.gd
"""

export var dialogName = ""
export(float) var textSpeed = 0.05
export(String) var next_screen = ""

const FILE_DIRECTORY = "res://.import/"#"res://Assets/Arts/"#
const DIALOG_DIRECTORY = "res://Assets/Dialogs/"

var dialog : Array 

var phraseNum := 0
var finished := false
var finished_dialog := false

var animation_type : String

func _ready() -> void:
	set_process(false)
	
	$DialogBox/Timer.wait_time = textSpeed
	dialog = get_dialog(dialogName)
	assert(dialog, "Dialog not found")

func start_dialog() -> void:
	set_process(true)
	next_phrase()

func _process(delta: float) -> void:
	$DialogBox/icon.visible = finished
	if finished:
		$DialogBox/AnimationPlayer.current_animation = animation_type

func _on_Button_dialog_pressed() -> void:
	if finished:
		next_phrase()
	else:
		$DialogBox/Text.visible_characters = len($DialogBox/Text.text)

func get_dialog(dialog_ : String) -> Array:
	var dialog_file = DIALOG_DIRECTORY + dialog_
	var f = File.new()
	assert(f.file_exists(dialog_file), "This file not exist.")
	
	f.open(dialog_file, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func next_phrase() -> void:
	pass
