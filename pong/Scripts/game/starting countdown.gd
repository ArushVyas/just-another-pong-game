# This script handles the starting countdown

extends Label

func starting_countdown():
	text = "3"
	
	await get_tree().create_timer(1).timeout
	text = "2"
	
	await get_tree().create_timer(1).timeout
	text = "1"
	
	await get_tree().create_timer(1).timeout
	text = "GO!"
	
	await get_tree().create_timer(1).timeout
	text = ""


func _ready():
	starting_countdown()
