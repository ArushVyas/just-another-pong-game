# This script control the end screen functionality

##TODO Make score display work properly!!

extends Control


func _on_play_again_pressed():
	Transition.change_scene(Transition.game)

func _on_home_pressed():
	Transition.change_scene(Transition.home_screen)
