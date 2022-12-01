extends KinematicBody2D


export var speed = 200.0
var velocity = Vector2.ZERO

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		velocity = Vector2.LEFT * speed
	elif Input.is_action_pressed("move_right"):
		velocity = Vector2.RIGHT * speed
	else:
		velocity = Vector2.ZERO

func _physics_process(delta):
	var _discarded = move_and_collide(velocity * delta)
