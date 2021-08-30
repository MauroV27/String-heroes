extends "res://Scenes/DialogBox/Dialog.gd"

"""
	Código que controla o dialogo no estilo novel.
	As bases do código estão no script Dialog.gd.
"""

onready var bodys = $Character_body

signal change_screen(new_scene)
signal add_text_to_historic

func start_dialog() -> void:
	set_process(true)
	next_phrase()
	ControllView.play_dialog_music()

func change_image_to(new_image_name:String) -> void:
	$Character_body.texture = images[new_image_name]

func next_phrase() -> void:
	
	if phraseNum >= len(dialog):
		if next_screen != "":
			emit_signal("change_screen", next_screen)
			set_process(false)
		else:
			queue_free()
		return
	
	finished = false
	
#	var img = FILE_DIRECTORY + dialog[phraseNum]["character"] + "/Body/" + dialog[phraseNum]["image"]
	
	$Character_body.visible = true
	
	#Gambiarra para as imaagesn aparecerem, posteriormente será atualizada:
	if dialog[phraseNum]["character"] == "Clarissa":
		change_image_to("Clarissa_default")
	elif dialog[phraseNum]["character"] == "Marianna":
		change_image_to("Marianna_default")
	else:
		print("O nome ", dialog[phraseNum]["character"], "gerou um valor invalido :(")
	
	animation_type = "body_move"
	
	send_data_to_historic(dialog[phraseNum]["character"], dialog[phraseNum]["text"])
	
	$DialogBox/Name.bbcode_text = "[b]" + dialog[phraseNum]["character"] + "[/b]"
	
	$DialogBox/Text.bbcode_text = dialog[phraseNum]["text"] 
	$DialogBox/Text.visible_characters = 0
	
	while $DialogBox/Text.visible_characters < len($DialogBox/Text.text):
		$DialogBox/Text.visible_characters += 1
		
		$DialogBox/Timer.start()
		yield($DialogBox/Timer, "timeout")
	
	phraseNum += 1
	finished = true

func send_data_to_historic(_name:String, _text:String) -> void:
	var dialog_speak = {
		"character" : _name,
		"text" : _text,
	}
	emit_signal("add_text_to_historic", dialog_speak)

func _on_Button_historic_pressed() -> void:
	$DialogHistoric.visible = true
	$DialogHistoric.show_text_in_historic_box()

