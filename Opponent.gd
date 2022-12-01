extends KinematicBody2D


export var speed = 200.0
# using this for difficulty settings. The closer to 1 this value is the better the follow-AI
export var ai_update_interval = 20 # every n frames, AI makes a decision
var frames_to_next_ai_update = ai_update_interval

var velocity = Vector2.ZERO
var ball

func _ready():
	ball = get_node('/root/Main/Ball')
	
func _physics_process(delta):
	var _discarded = move_and_collide(velocity * delta)
	frames_to_next_ai_update -= 1
	if frames_to_next_ai_update == 0:
		follow_ball_ai()
		frames_to_next_ai_update = ai_update_interval

func follow_ball_ai():
	var dirToVec = {
		"1": Vector2.RIGHT,
		"-1": Vector2.LEFT,
		"0": Vector2.ZERO
	}
	var dir = sign(ball.position.x - position.x)
	velocity = dirToVec[str(dir)] * speed
