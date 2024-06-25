extends Node2D


func _ready():
	$Timers/PilarDespawnCD.start()

func _on_bottom_pilar_area_body_entered(_body):
	pass # Replace with function body.


func _on_top_pilar_area_body_entered(_body):
	pass # Replace with function body.


func _on_pilar_despawn_cd_timeout():
	queue_free()


func _on_scoring_area_body_entered(_body):
	Globals.score += 1
