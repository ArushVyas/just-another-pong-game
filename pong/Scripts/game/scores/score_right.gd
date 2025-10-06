# This script control the right score display

extends Label

var score_right

func _ready():
	score_right = 0

func set_initial_score():
	# Idk why but the game starts with score = 2, so I made this -2 to cancel that behaviour
	score_right = -2
	text = str(score_right)

func increment_score():
	score_right += 1
	text = str(score_right)
	
	#TODO: add audio
	
	GlobalScores.global_score_right = score_right
