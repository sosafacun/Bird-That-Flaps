extends CharacterBody2D

@export var right_move_speed: float = 0
@export var gravity: int = 450
@export var jump_strength: int = -250

func _process(_delta):
	velocity.x += right_move_speed
	move_and_slide()

