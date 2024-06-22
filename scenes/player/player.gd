extends CharacterBody2D

var speed:int = 5

func _process(delta):
	if(Input.is_action_pressed("move_right_test")):
		velocity.x += 1
	if(Input.is_action_pressed("move_left_test")):
		velocity.x -= 1
	
	velocity.y += 1
	move_and_slide()


