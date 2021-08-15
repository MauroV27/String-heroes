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

var note : String

var note_has_activated : bool = false

func define_note(note_position: Vector2, note_type:String) -> void:
	global_position = note_position
	note = note_type
	$ColorRect.color = NOTE_COLOR[note]

func _process(delta: float) -> void:
	position.x += SPEED * delta
	if global_position.x <= 100:
		queue_free()

func _on_MusicalNote_area_entered(area: Area2D) -> void:
	if area.is_in_group("panel_pressed") and not note_has_activated:
		var dist = area.global_position - global_position
		get_parent().submit_distance_collide(abs(dist.x))
		note_has_activated = true
		queue_free()
