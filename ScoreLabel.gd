extends Label

func update_text(player_score, opponent_score):
	text = "{0} : {1}".format([str(player_score), str(opponent_score)])
