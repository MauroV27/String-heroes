extends Control

onready var historic = $Panel/TextHistoric

var text_historic = []

func _ready() -> void:
	show_text_in_historic_box()

func add_data_in_historic(new_data:Dictionary) -> void:
	if new_data.character != "" and new_data.text != "":
		text_historic.append(new_data)

func show_text_in_historic_box() -> void:
	var text_complete = ""
	
	for data in text_historic:
		text_complete += "[b][color=#ee5128]" + data.character + "[/color][/b] \n"
		text_complete += data.text + "\n"
	
	historic.bbcode_text = text_complete

func _on_Button_pressed() -> void:
	visible = false
