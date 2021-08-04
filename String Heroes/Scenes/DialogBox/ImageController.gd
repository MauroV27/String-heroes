extends Sprite

export(Array, Texture) var images

func _update_texture(new_texture_value:int) -> void:
	if  new_texture_value > 0 or new_texture_value < len(images):
		#impedir que um valor diferente do Array seja passado
		texture = images[new_texture_value]
