extends Node2D

const INIT_PILAR_SPEED: int = -150
const ACCELERATION: int = -100

var CLOUD_SPEED: int = -140
var GRASS_SPEED: int = -70
var HOUSE_SPEED: int = -30

@onready var spawn_speed: float = 2
@onready var spawn_timer_cut: float = 0.25

var game_started: bool = false

var pilars: PackedScene = preload("res://scenes/objects/pilars/pilars.tscn")
var cloud: PackedScene = preload("res://scenes/objects/clouds/clouds.tscn")

@onready var pilar_speed: int = INIT_PILAR_SPEED

@onready var level: int = Globals.score

signal level_up

func _process(delta):
	
	if(game_started):
		$GrassNode.position.x += GRASS_SPEED * delta
		$HousesNode.position.x += HOUSE_SPEED * delta
		
		for clouds in get_tree().get_nodes_in_group('Clouds'):
			clouds.position.x += CLOUD_SPEED * delta
		for pilar in get_tree().get_nodes_in_group('Pilars'):
			pilar.connect("game_lost", _on_pilars_game_lost)
			pilar.position.x += pilar_speed * delta
		
	if(Globals.score % 5 == 0 
	and Globals.score != 0
	and Globals.has_leveled_up == false):
		Globals.has_leveled_up = true
		level_up.emit()
		$"../Timers/PilarSpawn".wait_time = spawn_speed
		pilar_speed += ACCELERATION
		print(spawn_speed)

func _on_game_game_started() ->void:
	game_started = true
	$"../Timers/PilarSpawn".start()
	$"../Timers/CloudSpawn".start()

func create_pilars() ->void:
	var new_pilar = pilars.instantiate() as Node2D
	new_pilar.position.x = $Pilars.position.x
	new_pilar.position.y = randi_range(616, 236)
	$Pilars.add_child(new_pilar)

func create_clouds() ->void:
	var new_cloud = cloud.instantiate() as Node2D
	new_cloud.position.x = randi_range($Clouds.position.x - 100, $Clouds.position.x + 100)
	new_cloud.position.y = randi_range(-13, 100)
	$Clouds.add_child(new_cloud)

func _on_pilar_spawn_timeout():
	create_pilars()

func _on_cloud_spawn_timeout():
	create_clouds()

func _on_level_up():
	if(spawn_speed >= 0.75):
		spawn_speed -= spawn_timer_cut
	else:
		pass

func stop():
	CLOUD_SPEED = 0
	HOUSE_SPEED = 0
	GRASS_SPEED = 0
	pilar_speed = 0
	var tween: Tween = create_tween()
	tween.tween_property($"../UI/BlackScreen", "color", Color('000000'), 1)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/utils/end_screen.tscn")
	

func _on_pilars_game_lost():
	stop()

func _on_bottom_limit_body_entered(body):
	SFX.play_loss()
	stop()
