extends Position2D

const TEXT_FEEDBACK = preload("res://Scenes/Minigame2/Feedback/FeedbackText.tscn")

func show_feedback(message:String) -> void:
	var feedback = TEXT_FEEDBACK.instance()
	feedback.create_text(message)
	add_child(feedback)
