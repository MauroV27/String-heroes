extends Control

const NOTES = ["SOL", "FA", "MI", "RE", "DO", "SI", "LA"]

const NOTE_COLOR = {
	"DO" : Color("#2a327f"),
	"RE" : Color("#009f47"),
	"MI" : Color("#f6e95f"),
	"FA" : Color("#e78d37"),
	"SOL": Color("#d82b2e"),
	"LA" : Color("#c42c82"), 
	"SI" : Color("#812c7c"),
}

var initial_note = 0

func _ready() -> void:
	var note = initial_note
	for panel in $Panels.get_children():
#		panel.connect("note_sound", self, "actiavte_sound")
		panel.panel_color = NOTE_COLOR[NOTES[note]]
		panel._ready()
		note += 1 
		if note >= len(NOTE_COLOR):
			note = 0
