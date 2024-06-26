extends Control

func _ready():
	SFX.play_bgm()
	$Label2.text = Globals.save_data.top_player
	$Label.text = str(Globals.save_data.top_score)

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/Parallax/game.tscn")
