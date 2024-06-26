extends Area2D


func _on_body_entered(body: RigidBody2D):
	Globals.is_game_active = false
	body.sleeping = true
