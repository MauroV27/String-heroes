extends Area2D

export(Color) var panel_color = Color(1, 1, 1, 1)

var button_pressed : bool = false

signal note_sound

func _ready() -> void:	
	var color_hover = StyleBoxFlat.new()
	color_hover.set_bg_color(panel_color)
	$Button.set('custom_styles/hover', color_hover)
	$Button.set("custom_styles/pressed", color_hover)
	
	$space.disabled = true

func _on_Button_button_down() -> void:
	add_to_group("panel_pressed")
	$space.disabled = false

func _on_Button_button_up() -> void:
	remove_from_group("panel_pressed")
	$space.disabled = true
