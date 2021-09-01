extends Label

func create_text(score_text : String) -> void:
	text = score_text
	$AnimationPlayer.play("move_text")

func destroy_text() -> void:
	queue_free()
