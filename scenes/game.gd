extends Node2D


func _process(_delta):
	if(Input.is_action_pressed("jump")):
		Globals.is_game_active = true
		$UI/GameStartUI.visible = false
		$Player.right_move_speed = 0.25
