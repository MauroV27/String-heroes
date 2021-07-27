extends Control

#signal note_pressed

func _ready() -> void:
#	for panel in $Panels.get_children():
		#connect("note_pressed", panel, "update_scores")
#		panel.connect("update_scores", self, "note_pressed")
	pass
	

func update_scores(dist:float) -> void:
	print(dist)
	pass
