extends Node2D

const INIT_PILAR_SPEED: int = -150

var CLOUD_SPEED: int = -140
var GRASS_SPEED: int = -70
var HOUSE_SPEED: int = -30
var ACCELERATION: int = -50

var game_started: bool = false

var pilars: PackedScene = preload("res://scenes/objects/pilars/pilars.tscn")
var cloud: PackedScene = preload("res://scenes/objects/clouds/clouds.tscn")

@onready var pilar_speed: int = INIT_PILAR_SPEED

signal stop

func _process(delta):
	if(game_started):
		$GrassNode.position.x += GRASS_SPEED * delta
		$HousesNode.position.x += HOUSE_SPEED * delta
		
		for clouds in get_tree().get_nodes_in_group('Clouds'):
			clouds.position.x += CLOUD_SPEED * delta
		for pilar in get_tree().get_nodes_in_group('Pilars'):
			pilar.position.x += pilar_speed * delta
			pilar.connect("game_lost", _on_game_lost)
			
func _on_game_game_started():
	game_started = true
	$"../Timers/PilarSpawn".start()
	$"../Timers/CloudSpawn".start()

func create_pilars():
	var new_pilar = pilars.instantiate() as Node2D
	new_pilar.position.x = $Pilars.position.x
	new_pilar.position.y = randi_range(-270, 33)
	$Pilars.add_child(new_pilar)

func _on_game_lost(_body):
	stop.emit()

func create_clouds():
	var new_cloud = cloud.instantiate() as Node2D
	new_cloud.position.x = randi_range($Clouds.position.x - 100, $Clouds.position.x + 100)
	new_cloud.position.y = randi_range(-13, 100)
	$Clouds.add_child(new_cloud)

func _on_pilar_spawn_timeout():
	create_pilars()

func _on_cloud_spawn_timeout():
	create_clouds()

func _on_stop():
	print('stop')
