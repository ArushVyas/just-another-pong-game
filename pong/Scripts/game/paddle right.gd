# This script controls the right paddle motion
# Uses 'UP' and 'DOWN' arrow keys

extends AnimatableBody2D

const PADDLE_SPEED = 20

func set_initial_pos():
	position = Vector2(1859, 540) # Initial position

func _ready():
	set_initial_pos()

func _process(delta):
	var direction = Input.get_axis("right_paddle_up", "right_paddle_down")
	if direction:
		position.y += direction * delta * 1000
