extends Control

func _ready():
	SFX.play_bgm()
	update_labels()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/Parallax/game.tscn")

func _on_restart_scores_pressed():
	Globals.save_data.top_score = 0
	Globals.save_data.top_player = ""
	$Label4.visible = true
	Globals.save_data.save_scores()
	update_labels()

func update_labels():
	$Label2.text = Globals.save_data.top_player
	$Label.text = str(Globals.save_data.top_score)
