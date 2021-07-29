extends Node2D

# Deve possuir:
# - Uma interface para receber o comando de geração de nota;
# x Um sistema que crie as notas na tela;

const NOTE = preload("res://Scenes/Minigame2/NoteController/Note/MusicalNote.tscn")

signal update_scores( dist_note_panel )

var childrens 		# debug
var child_num = 0	# debug
var max_child_num 	# debug

const NOTES = ["FA", "DO"]

var spawner_id = 0
var spawner_dir = 1
var max_spawner_number = 45
var spawner_number = 0

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
#	child_num += 1
#	if child_num >= 45:
#		child_num = 0
#		debug_generator_notes_rand()
	pass

func debug_generator_notes_rand():
	# Exclua essa função que ela só serve para debug
	create_note(childrens[spawner_id].position)
	spawner_number += 1
	spawner_id += spawner_dir
	print(spawner_id)
	if spawner_id <= 0 or spawner_id >= (max_child_num-2):
		spawner_dir *= -1
	

func interface_to_add_note() -> void:
	
	pass

func create_note(note_position:Vector2) -> void:
	# Adiciona uma nota ao jogo
	var note = NOTE.instance()
	var type_note = NOTES[randi() % 2]
	note.define_note(note_position, type_note)
	add_child(type_note)

func submit_distance_collide(dist:float) -> void:
	emit_signal("update_scores", dist)

func _on_Timer_timeout() -> void:
	debug_generator_notes_rand()
	if spawner_number < max_spawner_number:
		$Timer.start()
	pass # Replace with function body.
