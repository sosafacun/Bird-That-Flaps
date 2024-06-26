extends ColorRect

func _ready():
	var tween: Tween = create_tween()
	tween.tween_property($"End-screen", "position", Vector2(250, 400), 0.5)
	$"End-screen/CurrentStats".visible = true
	$"End-screen/CurrentStats/Score".text = str(Globals.score)
	check_high_score()

func _process(_delta):
	if($"End-screen/CurrentStats/HighScoreMenu".visible == true):
		$AnimationPlayer.play("HighScore")


func _on_restart_pressed():
	reset_status()
	get_tree().change_scene_to_file("res://scenes/Parallax/game.tscn")


func _on_main_menu_pressed():
	reset_status()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu/main_menu.tscn")

func check_high_score():
	if(Globals.score > Globals.save_data.top_score):
		$"End-screen/CurrentStats/HighScoreMenu".visible = true

func reset_status() -> void:
	SFX.restart_bgm()
	Globals.is_game_active = false
	Globals.score = 0


func _on_button_pressed():
		Globals.save_data.top_score = Globals.score
		Globals.save_data.top_player = $"End-screen/CurrentStats/HighScoreMenu/SaveScore".text
		Globals.save_data.save_scores()
