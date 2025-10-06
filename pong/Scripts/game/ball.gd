# This script controls the ball motion

extends CharacterBody2D

const SPEED = 400.0

func _ready():
	set_initial_pos_and_velocity()

func set_initial_pos_and_velocity():
	
	position = Vector2(1920/2, 1080/2)
	
	# Starting timer
	velocity = Vector2(0, 0).normalized() # Clear out the velocity

	await get_tree().create_timer(3).timeout # Timer of 3 seconds
	#-
	
	#- Random velocity
	var x = randi_range(50, 100)
	var y = randi_range(-100, 100)
	var sign = randi_range(0, 1)
	if sign == 0:
		velocity = Vector2(x, y) * 4.8
	if sign == 1:
		velocity = - Vector2(x, y) * 4.8
	#-

func _physics_process(delta):
	#- Handle wall collision
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	#-
	
	move_and_slide()
