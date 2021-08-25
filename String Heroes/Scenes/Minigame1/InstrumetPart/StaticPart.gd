extends Sprite

"""
	Peça do instrumento na posição final ( dentro da caixa ou qualquer coisa assim ).
	Inicialmente vem invisivel ( alfa no 0 ) e depois de "colidir" com a peça com mesmo nome vai verficar se
	o controlador das peças ( puzzleController ) está na vez da peça, se tudo estiver OK a peça vai ficar visivel e o
	controlador vai destruir a peça movel. 
"""

export var area_collision : Shape2D
export var part_name : String = "Text"

signal piece_connected( piece)

func _ready() -> void:
	modulate = Color(1,1,1,0)

func _on_area_entered(area: Area2D) -> void:
	# Verifica se a área pertence ao grupo da partes moveis;
	if area.is_in_group("movel_part"):
		
		# Verifica se ambas as regiões tem o mesmo nome;
		if part_name == area.get_parent().get_part_name():
			
			# Verifica se a ordem do controlador ( PuzzleController ) está nessa peça
			if part_name == get_parent().get_parent().next_piece:
				modulate = Color(1,1,1,1)
				emit_signal("piece_connected", area.get_parent())
				$PieceConnected.play()
