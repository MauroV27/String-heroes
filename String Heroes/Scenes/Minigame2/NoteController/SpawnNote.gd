extends Node2D

const NOTE = preload("res://Scenes/Minigame2/NoteController/Note/MusicalNote.tscn")

signal update_scores( dist_note_panel )
signal end_game( result )

var childrens 		# debug
var child_num = 0	# debug
var max_child_num 	# debug

const NOTES = ["SOL", "FA", "MI", "RE", "DO", "SI", "LA"]

var spawner_id = 0
var spawner_dir = 1
var max_spawner_number = 41
var spawner_number = 0

func _ready() -> void:
	childrens = get_children()
	max_child_num = get_child_count()
	set_process(false)

func debug_generator_notes_rand():
	# Exclua essa função que ela só serve para debug
	create_note(childrens[spawner_id].position)
	spawner_number += 1
	spawner_id += spawner_dir
	if spawner_id <= 0 or spawner_id >= (max_child_num-2):
		spawner_dir *= -1

func create_note(note_position:Vector2) -> void:
	# Adiciona uma nota ao jogo
	var note = NOTE.instance()
	var type_note = NOTES[spawner_id % 7]
	note.define_note(note_position, type_note)
	add_child(note)

func submit_distance_collide(dist:float) -> void:
	emit_signal("update_scores", dist)

func _on_Timer_timeout() -> void:
	if spawner_number < max_spawner_number:
		debug_generator_notes_rand()
		$Timer.start()
	elif spawner_number == max_spawner_number: 
		debug_generator_notes_rand()
		$Timer.set_wait_time(6.0)
		$Timer.start()
	else:
		emit_signal("end_game", true)
