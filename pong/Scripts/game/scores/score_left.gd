# This script controls the left score display

extends Label

var score_left

func _ready():
	score_left = 0

func set_initial_score():
	# Idk why but the game starts with score = 2, so I made this -2 to cancel that behaviour
	score_left = -2
	text = str(score_left)

func increment_score():
	score_left += 1
	text = str(score_left)
	
	#TODO: add audio
	
	GlobalScores.global_score_left = score_left
