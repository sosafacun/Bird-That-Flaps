extends Node2D

signal game_lost

func _ready():
	$Timers/PilarDespawnCD.start()

func _on_bottom_pilar_area_body_entered(_body):
	lose_game()


func _on_top_pilar_area_body_entered(_body):
	lose_game()

func lose_game():
	SFX.play_loss()
	game_lost.emit()

func _on_pilar_despawn_cd_timeout():
	queue_free()


func _on_scoring_area_body_entered(_body):
	SFX.play_score()
	Globals.score += 1
