extends Node2D

@onready var pilar_position: Vector2 = Vector2(1000,0)
@onready var cloud_position: Vector2 = Vector2(1000,0)

signal game_started

func _process(_delta):
	if(Input.is_action_pressed("jump")):
		Globals.is_game_active = true
		$UI/GameStartUI.visible = false
		game_started.emit()
	
	$Player/Camera2D/VBoxContainer/ScoreLabel.text = str(Globals.score)

