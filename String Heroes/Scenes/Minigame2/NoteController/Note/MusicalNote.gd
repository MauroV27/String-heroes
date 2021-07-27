extends Area2D

const SPEED = -200

const COLOR_NOTE = [Color("#2a327f"), Color("#009f47"), Color("#f6e95f"), 
					Color("#e78d37"), Color("#d82b2e"), Color("#c42c82"), Color("#812c7c")]

func define_note(note_position: Vector2, note_type) -> void:
	global_position = note_position
	$ColorRect.color = COLOR_NOTE[note_type]
	pass

func _process(delta: float) -> void:
	position.x += SPEED * delta
	if global_position.x <= 100:
		queue_free()
	pass


func _on_MusicalNote_area_entered(area: Area2D) -> void:
	if area.is_in_group("panel_pressed"):
		var dist = area.global_position - global_position
		get_parent().submit_distance_collide(abs(dist.x))
		queue_free()
