extends Control

export(String) var item_name = "Text"
export(bool) var item_focus = false
export(PackedScene) var go_to_scene = null
export(Texture) var texture_normal 
export(Texture) var texture_hover 

var _intern_name_reference : String = "withoutName"

const ITEM_STATE = {
	"Selected" : {
		"opacity" : 1,
		"scale" : 1
	},
	"Deselected" : {
		"opacity" : 0.6,
		"scale" : 0.8
	},
}

func _ready() -> void:
	$item_name.text = item_name
	_intern_name_reference = name
	 
	if texture_hover != null and texture_normal != null:
		$Icon_button.texture_hover = texture_hover
		$Icon_button.texture_normal = texture_normal
	
	if not item_focus:
		set_scale(Vector2(0.8, 0.8))

func _on_IconButtons_mouse_entered() -> void:
	get_parent().change_item_focus(_intern_name_reference)

func effect_controller(state:Dictionary = ITEM_STATE.Deselected) -> void:
	modulate = Color(1,1,1, state.opacity)
	rect_scale = Vector2(state.scale,  state.scale)

func _on_Icon_button_pressed() -> void:
	get_parent().button_pressed_to_scene(go_to_scene)
	$sound_button_pressed.play()

func update_status_icon(itens:Dictionary) -> void:
	item_focus = itens[_intern_name_reference]
	if item_focus:
		effect_controller( ITEM_STATE.Selected )
	else:
		effect_controller( ITEM_STATE.Deselected )


