extends CanvasLayer

# This is a global scene

# This script handles the scenes transition (the fade in/out)
# Template for scene change:
# 		Transition.change_scene(Transition.<scene_name>)
# Write using this template in other nodes like buttons
# Scene names can be found below


# --------
# Scene names
const home_screen = ("res://Scenes/pre game/Home screen.tscn")
const how_to_play = ("res://Scenes/pre game/how to play.tscn")
const choose_gamemode = ("res://Scenes/Choose Gamemode.tscn") # This scene is unused
const game = ("res://Scenes/game/game.tscn")
const end_screen = ("res://Scenes/game/end screen.tscn")
# --------

func change_scene(scene_path):
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	
	get_tree().change_scene_to_file(scene_path)
	
	$AnimationPlayer.play_backwards("fade")
