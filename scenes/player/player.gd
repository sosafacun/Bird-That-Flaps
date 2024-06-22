extends CharacterBody2D

var speed:int = 500
@export var gravity: int = 450
@export var jump_strength: int = -250

func _process(_delta):
	velocity.y = gravity
	
	if(Input.is_action_just_pressed("select")):
		velocity.y = jump_strength
	move_and_slide()

