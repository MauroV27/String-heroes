extends "res://Scenes/DialogBox/Dialog.gd"
# Usa os códigos de Dialog.gd como base

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
	
	var img = FILE_DIRECTORY + dialog[phraseNum]["character"] + "/body/" + dialog[phraseNum]["image"]
	
	$Character_body.visible = true
	$DialogBox/Character_icon.visible = false
	$Character_body.texture = load(img)
	animation_type = "body_move"
	
	$DialogBox/Text.bbcode_text = dialog[phraseNum]["text"] 
	$DialogBox/Text.visible_characters = 0
	
	while $DialogBox/Text.visible_characters < len($DialogBox/Text.text):
		$DialogBox/Text.visible_characters += 1
		
		$DialogBox/Timer.start()
		yield($DialogBox/Timer, "timeout")
	
	phraseNum += 1
	finished = true
