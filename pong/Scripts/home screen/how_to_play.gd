# This script transitions to How to Play screen

extends Button

func _pressed():
	Transition.change_scene(Transition.how_to_play)
