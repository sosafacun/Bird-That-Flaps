extends Control

func _ready():
	SFX.play_bgm()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/Parallax/game.tscn")
