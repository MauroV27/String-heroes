extends Area2D

const MAX_LIFE : int = 12

var currently_life : int

func _ready() -> void:
	currently_life = MAX_LIFE
	pass

func update_clave_life(value:int) -> void:
	currently_life += value
	update_clave_view()

func update_clave_view() -> void:
	# O uso do ColorRect é temporario, apenas para fazer os testes
	var gray = float(currently_life)/ MAX_LIFE	
	$ColorRect.color = Color(1, gray, gray, 1)

func _on_Clave_area_entered(area: Area2D) -> void:
	if area.is_in_group("Note"):
		update_clave_life(-1)
		area.queue_free()
