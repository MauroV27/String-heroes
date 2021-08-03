extends Area2D

const SPEED = -200

const SOUNDS = "res://Assets/Sounds/Note_sounds/sounds.json"

const NOTE_COLOR = {
	"DO" : Color("#2a327f"),
	"RE" : Color("#009f47"),
	"MI" : Color("#f6e95f"),
	"FA" : Color("#e78d37"),
	"SOL": Color("#d82b2e"),
	"LA" : Color("#c42c82"), 
	"SI" : Color("#812c7c"),
}

const NOTE_FILES = {
	"DO": "res://Assets/Sounds/Note_sounds/Do.mp3",
	"RE": "res://Assets/Sounds/Note_sounds/Ré.mp3",
	"MI": "res://Assets/Sounds/Note_sounds/Mi.mp3",
	"FA": "res://Assets/Sounds/Note_sounds/Fá.mp3",
	"SOL": "res://Assets/Sounds/Note_sounds/Sol.mp3",
	"LA" : "res://Assets/Sounds/Note_sounds/Lá.mp3",
	"SI" : "res://Assets/Sounds/Note_sounds/Si.mp3",
}

var note : String

func define_note(note_position: Vector2, note_type:String) -> void:
	global_position = note_position
	note = note_type
	$ColorRect.color = NOTE_COLOR[note]

func _process(delta: float) -> void:
	position.x += SPEED * delta
	if global_position.x <= 100:
		queue_free()

func _on_MusicalNote_area_entered(area: Area2D) -> void:
	if area.is_in_group("panel_pressed"):
		var dist = area.global_position - global_position
		get_parent().submit_distance_collide(abs(dist.x))
		play_note_sound(note)

func play_note_sound(note_name:String) ->void:
	set_process(false)
	visible = false
	var path = NOTE_FILES[note_name]
#	var file = File.new()
#	if file.file_exists(path):
#		file.open(path, file.READ)
##		var aud = load(path)
#		var buffer = file.get_buffer(file.get_len())
#		var stream = AudioStreamMP3.new()
#		stream.data = buffer
##		stream.data = aud.get_buffer()
##		stream.resource_local_to_scene = aud
#		$NoteSound.stream = stream
#		$NoteSound.play()
	var aud = ResourceImporterMP3.load(path)
	var stream = AudioStreamMP3.new()
	stream.data = aud.get_buffer()
	$NoteSound.stream = stream
	$NoteSound.play()
	
func _on_NoteSound_finished() -> void:
	queue_free()

