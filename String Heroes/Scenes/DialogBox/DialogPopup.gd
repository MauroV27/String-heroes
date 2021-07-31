extends Control

export var dialogPath = ""
export(float) var textSpeed = 0.05
export(String) var next_screen = ""

const FILE_DIRECTORY = "res://Assets/Arts/"

var dialog

var phraseNum := 0
var finished := false
var finished_dialog := false

var animation_type : String

signal change_screen(new_scene)

func _ready() -> void:
	set_process(false)
	
	$DialogBox/Timer.wait_time = textSpeed
	dialog = get_dialog(dialogPath)
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
	var f = File.new()
	assert(f.file_exists(dialog_), "This file not exist.")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []


func next_phrase() -> void:
	if phraseNum >= len(dialog):
		if next_screen != "":
			emit_signal("change_screen", next_screen)
			set_process(false)
		else:
			queue_free()
		return
	
	finished = false
	
	var img = FILE_DIRECTORY + dialog[phraseNum]["character"] + "/icon/" + dialog[phraseNum]["image"]
	
	$DialogBox/Character_icon.visible = true
	$Character_body.visible = false
	$DialogBox/Character_icon.texture = load(img)
	animation_type = "icon_move"
	
	$DialogBox/Text.bbcode_text = dialog[phraseNum]["text"] 
	$DialogBox/Text.visible_characters = 0
	
	while $DialogBox/Text.visible_characters < len($DialogBox/Text.text):
		$DialogBox/Text.visible_characters += 1
		
		$DialogBox/Timer.start()
		yield($DialogBox/Timer, "timeout")
	
	phraseNum += 1
	finished = true






