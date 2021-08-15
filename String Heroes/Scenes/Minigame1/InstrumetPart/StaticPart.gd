extends Sprite

export var area_collision : Shape2D
export var part_name : String = "Text"

signal piece_connected( piece)

func _ready() -> void:
	modulate = Color(1,1,1,0)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("movel_part"):
		if part_name == area.get_parent().get_part_name():
			modulate = Color(1,1,1,1)
			emit_signal("piece_connected", area.get_parent())
			$PieceConnected.play()
#			area.get_parent().emit_signal("move_piece")
#			area.get_parent().queue_free()
