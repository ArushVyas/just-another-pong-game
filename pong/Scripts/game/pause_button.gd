# This script controls:
#	- pausing/unpausing of game
#	- showing/hiding of pause menu
#	- interaction of pause menu buttons with game (via global signals)

extends TextureButton

@onready var pause_menu = $"../../pause menu and end screen/PauseMenu"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS # Always process this button, regardless of game pause
	pause_menu.hide()
	
	#region Global signals reciever

	SignalManager.resume_pressed.connect(resume_pressed) # From pause_menu script
	SignalManager.relaunch_ball_pressed.connect(relaunch_ball_pressed)

	#endregion


#region Basic button toggle

func _toggled(toggled_on):
	if toggled_on:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()

#endregion


#region Global signals handling

func resume_pressed():
	get_tree().paused = false
	pause_menu.hide()

func relaunch_ball_pressed():
	get_tree().paused = false
	pause_menu.hide()

#endregion
