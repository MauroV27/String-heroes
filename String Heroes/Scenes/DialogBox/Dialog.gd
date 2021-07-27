extends Control

export var dialogPath = ""
export(float) var textSpeed = 0.05
export(String) var next_screen = ""

const FILE_DIRECTORY = "res://Assets/Arts/"

var dialog

var phraseNum = 0
var finished = false

var finished_dialog = false

signal change_screen(new_scene)

func _ready() -> void:
	set_process(false)
	
	$DialogBox/Timer.wait_time = textSpeed
	dialog = get_dialog(dialogPath)
	assert(dialog, "Dialog not found")
	
#	next_phrase()

func start_dialog() -> void:
	set_process(true)
	next_phrase()
	pass

func _process(delta: float) -> void:
	$DialogBox/icon.visible = finished
	if finished:
		$DialogBox/AnimationPlayer.current_animation = "icon_move"
	
	if Input.is_action_just_pressed("ui_accept"):
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
	
#	$Name.bbcode_text = dialog[phraseNum]["Name"]
	var img = FILE_DIRECTORY + dialog[phraseNum]["character"] + "/" + dialog[phraseNum]["type"] + "/" + dialog[phraseNum]["image"]
	$DialogBox/Character_icon.texture = load(img)
	
	$DialogBox/Text.bbcode_text = dialog[phraseNum]["text"] 
	
	$DialogBox/Text.visible_characters = 0
	
	while $DialogBox/Text.visible_characters < len($DialogBox/Text.text):
		$DialogBox/Text.visible_characters += 1
		
		$DialogBox/Timer.start()
		yield($DialogBox/Timer, "timeout")
	
	phraseNum += 1
	finished = true
	return
	
