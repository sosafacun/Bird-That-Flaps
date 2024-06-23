extends CanvasLayer



func _on_day_night_follow_daylight():
	modulate_skybox("0092d3")

func _on_day_night_follow_nightlight():
	modulate_skybox("001726")


func modulate_skybox(target_color: String) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(%Skybox, "modulate", Color(target_color), 2)
