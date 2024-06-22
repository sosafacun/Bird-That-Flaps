extends Node2D

var cloud1: PackedScene = preload("res://scenes/objects/cloud_1.tscn")
var cloud2: PackedScene = preload("res://scenes/objects/cloud_2.tscn")
var pilars: PackedScene = preload("res://scenes/objects/pilars.tscn")

@export var PILAR_SPEED: int = 2

const HOUSES_SPEED: int = 3
const CLOUD_SPEED: int = 1
const GRASS_SPEED: int = 5

func _on_day_night_follow_daylight() -> void:
	modulate_skybox(%Skybox, '0074a9' )

func _on_day_night_follow_nightlight() -> void:
	modulate_skybox(%Skybox, '000e19' )

func modulate_skybox(sky_box: ColorRect, color: String):
	var tween: Tween = create_tween()
	tween.tween_property(sky_box, "modulate", Color(color), 2)


func _process(_delta):
	move_level()

func move_level():
	$Houses.position.x -= HOUSES_SPEED
	$Pilars.position.x -= PILAR_SPEED
	$Clouds.position.x -= CLOUD_SPEED
	$Grass.position.x -= GRASS_SPEED

#x = 550
#pilars.y: -174; 40
#clouds.y: 0 ;178

func delete_scene():
	pass
