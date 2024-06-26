extends Node2D

@onready var pilar_position: Vector2 = Vector2(1000,0)
@onready var cloud_position: Vector2 = Vector2(1000,0)

signal game_started

func _process(_delta):
	if(Input.is_action_pressed("jump") 
	and Globals.is_game_active == false
	and Globals.is_game_finished == false)	:
		
		Globals.is_game_active = true
		$UI/GameStartUI.visible = false
		game_started.emit()
	
	if(Input.is_action_just_pressed("jump")
	and Globals.is_game_active == true):
		$Player.jump()
		$UI/VBoxContainer/ScoreLabel.text = str(Globals.score)

