# This script controls game flow and displays the end screen

##TODO Add code for relaunch ball

extends Node2D

func _ready():
	reset_only_scores()
	
	reset_except_scores()
	
	#region Global signals reciever
	SignalManager.quit_game_pressed.connect(quit_game_pressed)
	SignalManager.relaunch_ball_pressed.connect(relaunch_ball)
	#endregion

func _process(_delta):
	end_game()

#region Import local scripts

@onready var starting_countdown = $"CanvasLayer game/starting countdown"

@onready var score_left = $"CanvasLayer game/score left"
@onready var score_right = $"CanvasLayer game/score right"

@onready var paddle_left = $"CanvasLayer player/paddle left"
@onready var paddle_right = $"CanvasLayer player/Paddle right"

@onready var ball = $"CanvasLayer player/ball"

#endregion

#region User defined functions

func reset_except_scores():
	starting_countdown.starting_countdown()
	ball.set_initial_pos_and_velocity()
	
	paddle_left.set_initial_pos()
	paddle_right.set_initial_pos()
	
func reset_only_scores():
	score_left.set_initial_score()
	score_right.set_initial_score()

#endregion

#region Score control

func _on_left_loses_body_entered(_body): # Left loses, right scores
	score_right.increment_score()
	reset_except_scores()
	
func _on_right_loses_body_entered(_body): # Right loses, left scores
	score_left.increment_score()
	reset_except_scores()

#endregion

#region Relaunch ball

func relaunch_ball():
	starting_countdown.starting_countdown()
	
	paddle_left.set_initial_pos()
	paddle_right.set_initial_pos()
	
	ball.set_initial_pos_and_velocity()

#endregion

#region END GAME

func end_game():
	if score_left.text == "5" or score_right.text == "5":
		get_tree().unload_current_scene()
		Transition.change_scene(Transition.end_screen)

func quit_game_pressed():
	get_tree().paused = false
	Transition.change_scene(Transition.home_screen)

#endregion
