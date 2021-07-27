extends HBoxContainer

#Controla os icones dos jogos no menu inicial.

const all_item_focus = {}
signal seletor_button_pressed(go_to_scene)

func _ready() -> void:
	for child in get_children():
		all_item_focus[child.item_name] = child.item_focus	
		child.effect_controller(0.6, 0.8)

func change_item_focus(new_focus:String) -> void:
	for item in all_item_focus:
		all_item_focus[item] = false
	
	all_item_focus[new_focus] = true

	for child in get_children():
		child.update_status_icon(all_item_focus)

func button_pressed_to_scene(next_scene:PackedScene) -> void:
	emit_signal("seletor_button_pressed", next_scene)

