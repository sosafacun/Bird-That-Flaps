extends ParallaxLayer

signal on_screen

func _ready():	
	on_screen.emit()

func _on_on_screen():
	var new_position: Vector2
	new_position.y = randi_range(-161, 76)
	position = new_position
