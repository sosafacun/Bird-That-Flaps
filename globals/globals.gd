extends Node

var is_game_active: bool = false
var has_leveled_up: bool = true
var score: int = 0

var save_data: SaveData

func _ready():
	save_data = SaveData.load_or_create()
