extends Node2D

# Deve possuir:
# - Uma interface para receber o comando de geração de nota;
# x Um sistema que crie as notas na tela;

const NOTE = preload("res://Scenes/Minigame2/NoteController/Note/MusicalNote.tscn")

signal update_scores( dist_note_panel )

var childrens 		# debug
var child_num = 0	# debug
var max_child_num 	# debug

func _ready() -> void:
	childrens = get_children()
	max_child_num = get_child_count()
	set_process(false)
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	# Exclua essa função que ela só serve para debug
	if Input.is_action_pressed("ui_up"):
		set_process( not is_processing() )

func _process(delta: float) -> void:
	# Exclua essa função que ela só serve para debug
	child_num += 1
	if child_num >= 45:
		child_num = 0
		debug_generator_notes_rand()

func debug_generator_notes_rand():
	# Exclua essa função que ela só serve para debug
	var posY = randi() % max_child_num
	create_note(childrens[posY].position)
	

func interface_to_add_note() -> void:
	
	pass

func create_note(note_position:Vector2) -> void:
	# Adiciona uma nota ao jogo
	var note = NOTE.instance()
		
	note.define_note(note_position, child_num % 7)
	add_child(note)

func submit_distance_collide(dist:float) -> void:
	emit_signal("update_scores", dist)
