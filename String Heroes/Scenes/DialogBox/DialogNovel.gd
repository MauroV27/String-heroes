extends "res://Scenes/DialogBox/Dialog.gd"
# Usa os códigos de Dialog.gd como base

onready var bodys = $Character_body

signal change_screen(new_scene)

func start_dialog() -> void:
	set_process(true)
	next_phrase()
	$music.play()

func next_phrase() -> void:
	if phraseNum >= len(dialog):
		if next_screen != "":
			emit_signal("change_screen", next_screen)
			$music.stop()
			set_process(false)
		else:
			queue_free()
		return
	
	finished = false
	
#	var img = FILE_DIRECTORY + dialog[phraseNum]["character"] + "/Body/" + dialog[phraseNum]["image"]
	
	$Character_body.visible = true
	$DialogBox/Character_icon.visible = false
	
	#Gambiarra para as imaagesn aparecerem, posteriormente será atualizada:
	if dialog[phraseNum]["character"] == "Clarissa":
		bodys._update_texture(0)
	elif dialog[phraseNum]["character"] == "Marianna":
		bodys._update_texture(1)
	else:
		print("O nome ", dialog[phraseNum]["character"], "gerou um valor invalido :(")
	
	animation_type = "body_move"
	
	$DialogBox/Text.bbcode_text = dialog[phraseNum]["text"] 
	$DialogBox/Text.visible_characters = 0
	
	while $DialogBox/Text.visible_characters < len($DialogBox/Text.text):
		$DialogBox/Text.visible_characters += 1
		
		$DialogBox/Timer.start()
		yield($DialogBox/Timer, "timeout")
	
	phraseNum += 1
	finished = true
