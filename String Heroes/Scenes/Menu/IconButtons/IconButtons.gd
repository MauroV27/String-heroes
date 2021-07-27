extends Control

export(String) var item_name = "Text"
export(bool) var item_focus = false
export(PackedScene) var go_to_scene = null
export(Texture) var texture_normal #= "res://Assets/UI/Menus/Icons/imagem_placeholder_disabled.png"
export(Texture) var texture_hover #= "res://Assets/UI/Menus/Icons/imagem_placeholder_enabled.png"

func _ready() -> void:
	$item_name.text = item_name
	
	if texture_hover != null and texture_normal != null:
		$Icon_button.texture_hover = texture_hover
		$Icon_button.texture_normal = texture_normal
	
	if item_focus == true:
		effect_controller(1, 1)

func _on_IconButtons_mouse_entered() -> void:
	effect_controller(1, 1)
	get_parent().change_item_focus(item_name)

func effect_controller(value:float, scale:float) -> void:
	modulate = Color(1,1,1, value)
	rect_scale = Vector2(scale, scale)

func _on_Icon_button_pressed() -> void:
	get_parent().button_pressed_to_scene(go_to_scene)

func update_status_icon(itens:Dictionary) -> void:
	item_focus = itens[item_name]
	if item_focus:
		effect_controller(1, 1)
	else:
		effect_controller(0.6, 0.8)


