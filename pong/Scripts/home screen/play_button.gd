extends TextureButton

func _pressed():
	Transition.change_scene(Transition.game) # Transition to choose gamemode scene
