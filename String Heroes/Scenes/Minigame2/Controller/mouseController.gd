extends Area2D

export var min_position_vertical : float = 0
export var max_position_vertical : float = 100

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.y = clamp(get_global_mouse_position().y, min_position_vertical, max_position_vertical)
