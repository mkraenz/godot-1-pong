extends Node

var player_score = 0
var opponent_score = 0
var game_started = false

func _ready():
	seed("Hello world".hash())

func _process(_delta):
	if Input.is_action_pressed("kickoff"):
		if game_started:
			kickoff_after_score()
		else:
			new_game()
		
func _on_Hud_start_game():
	new_game()

func _on_Ball_opponent_scored():
	$Ball.stop()
	$Ball.reset()
	opponent_score += 1
	update_hud()
	start_show_hint_timer()

func _on_Ball_player_scored():
	$Ball.stop()
	$Ball.reset()
	player_score += 1
	update_hud()
	start_show_hint_timer()

func new_game():
	game_started = true
	$Ball.reset()
	$StartTimer.start()
	$Hud.hide_title_menu()
	yield($StartTimer, "timeout")
	$Ball.start()

func kickoff_after_score():
	$Ball.start()
	$ShowHintTimer.stop()
	$Hud.hide_hint()

func update_hud():
	$Hud.set_score(player_score, opponent_score)

func game_over():
	game_started = false
	$Ball.stop()

func start_show_hint_timer():
	$ShowHintTimer.start()

func _on_ShowHintTimer_timeout():
	$Hud.show_hint()
