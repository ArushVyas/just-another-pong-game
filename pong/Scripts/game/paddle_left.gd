# This script controls the left paddle motion
# Uses 'W' and 'S' keys

extends AnimatableBody2D

const PADDLE_SPEED = 20

func set_initial_pos():
	position = Vector2(62, 540) # Initial position


func _ready():
	set_initial_pos()

func _process(delta):
	var direction = Input.get_axis("left_paddle_up", "left_paddle_down")
	if direction:
		position.y += direction * delta * 1000
