extends Camera2D

export(Vector2) var cam_target = Vector2.ZERO

func move_cam() -> void:
	position = cam_target

func set_cam_target(new_target:Vector2) -> void:
	if cam_target != new_target:
		cam_target = new_target
		move_cam()

func get_cam_position() -> Vector2:
	return position
	
