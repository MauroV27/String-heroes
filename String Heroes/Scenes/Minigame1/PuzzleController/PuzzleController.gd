extends Node2D

var currently_piece 
var max_number_of_pieces : int
var currently_pieces_connected : int = 0

# Verifica se o dialogo está travadp ou não
var dialog_is_paused : bool = false

# Objeto invisivel que serve de prevenção de erros de objeto == null
onready var null_part = $NullObj

signal game_complete( true )
signal part_add

var pieces_queue : PoolStringArray = [
	"tampa", "alma", "tampoSup","braco", "conjunto", "aberturaS",  
	"queixeira", "voluta", "cravelha", "espelho", "cordas"
]

var piece_currently_index : int = 0 
var next_piece : String = pieces_queue[piece_currently_index]

func _ready() -> void:
	set_process(false)
	currently_piece = null_part
	
	for piece in $MovePieces.get_children():
		piece.connect("move_piece", self, "move_selected_piece")
		max_number_of_pieces += 1
	
	for  piece_static in $StaticPieces.get_children():
		piece_static.connect("piece_connected", self, "update_pieces_connected")

func move_selected_piece( piece ) -> void:
	if typeof(piece) != TYPE_BOOL:
		currently_piece = piece
	else: 
		currently_piece = null_part

func start_game() -> void:
	set_process(true)

func update_pieces_connected( piece )-> void:
	if piece.get_part_name() != next_piece:
		piece.restar_position()
	else:
		currently_piece = null_part
		
		piece.queue_free()
		emit_signal("part_add")
		
		piece_currently_index += 1 
		if piece_currently_index == len(pieces_queue):
			emit_signal("game_complete")
		else:
			next_piece = pieces_queue[piece_currently_index]

func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("click_left"):
		currently_piece.selected = not currently_piece.selected

func _on_DialogPopup_connect_with_puzzle_controller(dialog_is_running) -> void:
	dialog_is_paused = not dialog_is_running
	print(dialog_is_paused)
