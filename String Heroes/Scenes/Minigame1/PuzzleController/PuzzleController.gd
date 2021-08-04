extends Node2D

var currently_piece 
var max_number_of_pieces : int
var currently_pieces_connected : int = 0

var dialog 

signal game_complete( true )
signal part_add

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
	currently_piece = $NullObj
	piece.queue_free()
	emit_signal("part_add")
	currently_pieces_connected += 1 
	if currently_pieces_connected == max_number_of_pieces:
		emit_signal("game_complete")

func _input(event: InputEvent) -> void:
	if currently_piece == null:
		return
	
	if Input.is_action_just_pressed("click_left"):
		currently_piece.selected = not currently_piece.selected

