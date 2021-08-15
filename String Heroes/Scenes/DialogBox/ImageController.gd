extends Sprite

#export(Array, Texture) var images_datas 
#export(Array, String) var images_names
#
#var images : Dictionary
#
#func connect_names_with_textures() -> void:
#	for id in len(images_datas):
#		var image_name = images_names[id] || id
#		var image_data = images_datas[id]
#
#		images[image_name] = image_data
#
#func change_image_to(new_image_name:String) -> void:
#	texture = images[new_image_name]
