extends Sprite

export var area_collision : Shape2D
export var part_name : String = "Text"

var selected : bool = false
var initial_position : Vector2

signal move_piece( piece )

func _ready() -> void:
	$Area/Collision.shape = area_collision
	initial_position = position

func _process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)

func _on_mouse_entered() -> void:
	emit_signal("move_piece", self)
#	Input.set_custom_mouse_cursor(null, Input.CURSOR_DRAG)

func _on_mouse_exited() -> void:
	emit_signal("move_piece", self)
#	Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)
	selected = false

func get_part_name() -> String:
	return part_name

func restar_position() -> void:
	position = initial_position
