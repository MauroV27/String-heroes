extends CanvasLayer

onready var animation = $Control/AnimationPlayer

var scene : String

func _change_scene(new_scene, anim) -> void:
	scene = (new_scene)
	animation.play(anim)

func _new_scene()-> void:
	var err = get_tree().change_scene(scene)
	if err != OK:
		print("A erro has ocorred in scene transition: " + scene)

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		scene = "res://Scenes/Menu/Menu.tscn"
		_new_scene()

func _change_music(new_music:String) -> void:
#	var music = AudioStreamMP3.new()
#	music.resource_path = new_music
#	$music.stream = music
#	$music.play()
	pass
