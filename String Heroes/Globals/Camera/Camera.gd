extends Camera2D

"""
	Sistema de controle de transição de telas dentro de uma
	mesma cena. O sistema recebe um "target" e a camera se move 
	em direção ao target.
"""

# variavel do alvo ("target") que funciona como observador
export(Vector2) var cam_target = Vector2.ZERO

#Função privada que serve para mudar a posição da camera
func _move_cam() -> void:
	position = cam_target

func set_cam_target(new_target:Vector2) -> void:
	if cam_target != new_target:
		cam_target = new_target
		_move_cam()

func get_cam_position() -> Vector2:
	return position
	
