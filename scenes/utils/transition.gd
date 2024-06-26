extends ColorRect

func _ready():
	var tween: Tween = create_tween()
	tween.tween_property($"End-screen", "position", Vector2(250, 400), 0.5)
	$"End-screen/ScreenContainer".visible = true
	$"End-screen/ScreenContainer/Score".text = str(Globals.score)

func _on_restart_pressed():
	reset_status()
	get_tree().change_scene_to_file("res://scenes/Parallax/game.tscn")


func _on_main_menu_pressed():
	reset_status()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func reset_status() -> void:
	SFX.restart_bgm()
	Globals.is_game_active = false
	Globals.score = 0
