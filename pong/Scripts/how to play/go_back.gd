extends TextureButton

func _pressed():
	preload("res://Scenes/pre game/Home screen.tscn")
	Transition.change_scene(Transition.home_screen)
