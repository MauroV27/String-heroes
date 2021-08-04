extends Area2D

const MAX_LIFE : int = 12

var currently_life : int

signal end_game( result )

func _ready() -> void:
	currently_life = MAX_LIFE

func update_clave_life(value:int) -> void:
	currently_life += value
	update_clave_view()
	if currently_life == 0:
		emit_signal("end_game", false)

func update_clave_view() -> void:
	$Sprite.frame = int(floor((MAX_LIFE - currently_life) / 4.0))

func _on_Clave_area_entered(area: Area2D) -> void:
	if area.is_in_group("Note"):
		update_clave_life(-1)
		area.queue_free()
