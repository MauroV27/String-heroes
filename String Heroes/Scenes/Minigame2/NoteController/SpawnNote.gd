extends Node2D

const NOTE = preload("res://Scenes/Minigame2/NoteController/Note/MusicalNote.tscn")

export var level_map_name = ""
export var music_file : AudioStream

signal update_scores( dist_note_panel )
signal end_game( result )

var childrens 		# debug
#var child_num = 0	# debug
var max_child_num 	# debug

#const NOTES = ["SOL", "FA", "MI", "RE", "DO", "SI", "LA"]

var level_map : Array

var last_map_data : Dictionary

var spawner_id : int = 0
var spawner_number : int = 0
#var spawner_dir = 1
#var max_spawner_number = 10#41

var time_total : float = 0.0 

func _ready() -> void:
	childrens = get_children()
	max_child_num = get_child_count()
	set_process(false)
	
	level_map = load_note_map()

func start_game() -> void:
	$Timer.start()
	
	$music.stream = music_file
	$StartMusic.start()
	if len(level_map) > 0:
		call_note_in_note_map()
		
func stop_spawn() -> void:
	$music.stop()

func load_note_map() -> Array:
	var map_file = "res://Assets/Concerto/noteMaps/" + level_map_name
	var f = File.new()
	assert(f.file_exists(map_file), "This file not exist.")
	
	f.open(map_file, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func call_note_in_note_map() -> void:
	var data = level_map[spawner_number]
	
	var spawner_ = childrens[data.spawner_id].position
	last_map_data = {"spawner" : spawner_, "note_type" : data.note_type}
	
	time_total += data.wait_time # Adiciona o valor de tempo total da nota
	
	$Timer.set_wait_time( float(data.wait_time) )
	spawner_number += 1

func create_note(note_position:Vector2, note_type : String = "FA") -> void:
	# Adiciona uma nota ao jogo
	var note = NOTE.instance()
	note.define_note(note_position, note_type)
	add_child(note)
	
	if spawner_number <= len(level_map) + 1:
		call_note_in_note_map() 

func submit_distance_collide(dist:float) -> void:
	emit_signal("update_scores", dist)

func _on_Timer_timeout() -> void:
	if spawner_number < len(level_map):
		create_note(last_map_data.spawner, last_map_data.note_type)
	elif spawner_number == len(level_map):
		$Timer.set_wait_time(4.0)
		$Timer.start()
		# Gambiarra vergonhosa que fiz para testar se tá tudo certo.
		spawner_number = spawner_number + 10 
	else:
		emit_signal("end_game", true)


func _on_StartMusic_timeout() -> void:
	$music.play()

func destroy_all_notes():
	for child in get_children():
		if child.is_in_group("Note"):
			child.queue_free()
