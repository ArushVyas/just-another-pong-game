# This script controls everything related to pause menu signals emission

extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


func _on_resume_pressed():
	SignalManager.resume_pressed.emit() # Connects to pause_button script

func _on_relaunch_ball_pressed():
	SignalManager.relaunch_ball_pressed.emit() # Connects to game master

func _on_quit_game_pressed():
	SignalManager.quit_game_pressed.emit() # Connects to game master
