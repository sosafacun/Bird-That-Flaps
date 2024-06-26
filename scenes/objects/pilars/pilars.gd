extends StaticBody2D

signal game_lost

func _ready():
	$PilarDespawnCD.start()

func _on_pilar_despawn_cd_timeout():
	queue_free()

func _on_scoring_area_body_entered(_body):
	SFX.play_score()
	Globals.score += 1
	Globals.has_leveled_up = false


func _on_losin_area_body_entered(body:RigidBody2D):
	body.sleeping = true
	Globals.is_game_active = false
	SFX.play_loss()
	game_lost.emit()
