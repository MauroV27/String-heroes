extends Control

const NOTE_FILES = {
	"FA": "res://Assets/Sounds/Note_sounds/Fá.mp3",
}

func _ready() -> void:
	for panel in $Panels.get_children():
		panel.connect("note_sound", self, "actiavte_sound")

func actiavte_sound(note_sound:String) -> void:
#	var path = NOTE_FILES[note_sound]
#	var file = File.new()
#	if file.file_exists(path):
#		file.open(path, file.READ)
#		var buffer = file.get_buffer(file.get_len())
#		var stream = AudioStreamMP3.new()
#		stream.data = buffer
#		$NoteSound.stream = stream
#		$NoteSound.play()
	pass

