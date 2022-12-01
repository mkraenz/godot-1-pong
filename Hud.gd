extends CanvasLayer

func set_score(player_score, opponent_score):
	$ScoreLabel.update_text(player_score, opponent_score)

func hide_title_menu():
	set_score(0, 0)
	$ScoreLabel.show()
	$TitleLabel.hide()
	$HowtoLabel.hide()

func show_title_menu():
	$ScoreLabel.hide()
	$TitleLabel.show()
	$HowtoLabel.show()
	
func show_hint():
	$HowtoLabel.show()
	
func hide_hint():
	$HowtoLabel.hide()
