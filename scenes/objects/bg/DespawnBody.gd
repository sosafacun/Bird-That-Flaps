extends StaticBody2D

func despawn():
	get_parent().queue_free()
