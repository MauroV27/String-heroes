extends HBoxContainer

#Controla os icones dos jogos no menu inicial.

const all_item_focus = {}

signal seletor_button_pressed(go_to_scene)

func _ready() -> void:
	var _first_focus_item 
	
	for child in get_children():
		all_item_focus[child.name] = child.item_focus
		if child.item_focus:
			_first_focus_item = child.name
#			child.rect_scale = Vector2(.8, .8)
	
	print(all_item_focus)
	change_item_focus(_first_focus_item)

func prepare_icons(): 
	for child in get_children():
		if not child.item_focus:
			child.rect_scale = Vector2(.8, .8)

func change_item_focus(new_focus:String) -> void:
	for item in all_item_focus:
		all_item_focus[item] = false
	
	all_item_focus[new_focus] = true
	
	for child in get_children():
		child.update_status_icon(all_item_focus)

func button_pressed_to_scene(next_scene:PackedScene) -> void:
	emit_signal("seletor_button_pressed", next_scene)

