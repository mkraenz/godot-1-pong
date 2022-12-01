extends KinematicBody2D

signal player_scored
signal opponent_scored

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed_factor = 1.1
var max_speed_factor = 6 # i.e. 6 times original speed is max speed
var updating = false

var rng = RandomNumberGenerator.new()
var speed = 200.0
var min_speed = 100.0
var velocity = Vector2.ZERO

func _ready():
	rng.seed = "Hello world".hash()
	reset()

func _physics_process(delta):
	if updating:
		var collision = move_and_collide(velocity * delta)
		if collision:
			velocity = velocity.bounce(collision.normal)
			velocity = (velocity * speed_factor).limit_length(speed * max_speed_factor)
			
			if collision.collider.name == 'top':
				emit_signal("player_scored")
			if collision.collider.name == 'bottom':
				emit_signal("opponent_scored")

func start():
	set_updating(true)

func stop():
	set_updating(false)

func set_updating(enabled):
	updating = enabled

func reset():
	position = get_viewport_rect().get_center()
	velocity = Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1)) * speed
	if velocity.length() < min_speed:
		velocity = (velocity * 9999).limit_length(min_speed)
