extends CanvasLayer

onready var animation = $Control/AnimationPlayer

var scene : String

func _change_scene(new_scene, anim) -> void:
	scene = new_scene
	animation.play(anim)

func _new_scene()-> void:
	var err = get_tree().change_scene(scene)
	if err != OK:
		print("A erro has ocorred in scene transition: " + scene)
