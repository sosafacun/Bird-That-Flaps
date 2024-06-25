extends Node

func play_bgm():
	$"0 - BGM".play()

func play_score():
	$"1 - Score".play()

func play_loss():
	$"0 - BGM".stop()
	$"2 - Loss".play()


func _on___loss_finished():
	$"3 - AfterLoss".play()
