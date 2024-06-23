extends Node2D

var pilars:PackedScene = preload("res://scenes/objects/collidable/pilars.tscn")

var pilar_position: Vector2 = Vector2(630,0)


signal game_started

func _process(_delta):
	if(Input.is_action_pressed("jump")):
		Globals.is_game_active = true
		$UI/GameStartUI.visible = false
		$Player.right_move_speed = 0.25
		game_started.emit()

func _on_despawn_area_body_entered(body):
	body.despawn()

func create_pilars():
	var new_pilar = pilars.instantiate() as Node2D
	new_pilar.position.x = pilar_position.x
	new_pilar.position.y = randi_range(-270, 33)
	pilar_position.x += 250
	$Pilars.add_child(new_pilar)
	
func _on_game_started():
	$Timers/Pilar1CD.start()

func _on_pilar_1cd_timeout():
	create_pilars()
