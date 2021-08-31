extends Node2D

var currently_piece 
var max_number_of_pieces : int
var currently_pieces_connected : int = 0

var dialog 

signal game_complete( true )
signal part_add

var pieces_queue : PoolStringArray = [
	"tampa", "alma", "tampoSup","braço", "conjunto", "aberturaS",  
	"queixeira", "voluta", "cravelha", "espelho", "cordas"
]

var piece_currently_index : int = 0 
var next_piece : String = pieces_queue[piece_currently_index]

func _ready() -> void:
	set_process(false)
	currently_piece = $NullObj
	for piece in $MovePieces.get_children():
		piece.connect("move_piece", self, "move_selected_piece")
		max_number_of_pieces += 1
	
	for  piece_static in $StaticPieces.get_children():
		piece_static.connect("piece_connected", self, "update_pieces_connected")

func move_selected_piece( piece ) -> void:
	currently_piece = piece

func start_game() -> void:
	set_process(true)

func update_pieces_connected( piece )-> void:
	if piece.get_part_name() != next_piece:
		piece.restar_position()
	else:
		currently_piece = $NullObj
		piece.queue_free()
		emit_signal("part_add")
		
		print("index peça atual:", piece_currently_index)
		piece_currently_index += 1 
		if piece_currently_index == len(pieces_queue):
			emit_signal("game_complete")
		else:
			next_piece = pieces_queue[piece_currently_index]

func _input(event: InputEvent) -> void:
	if currently_piece == null:
		return
	
	if Input.is_action_just_pressed("click_left"):
		currently_piece.selected = not currently_piece.selected

