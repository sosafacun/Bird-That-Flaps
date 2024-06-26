extends RigidBody2D

@export var jump_strength: int = -300
@export var grav: int = 0

func _physics_process(_delta):
	if(Globals.is_game_active):
		grav = 1
		gravity_scale = grav
	else:
		gravity_scale = grav
	
func jump() -> void:
	set_linear_velocity(Vector2(0,0))
	linear_velocity.y += jump_strength
	if(!Globals.is_game_finished):
		$AnimationPlayer.play("flap")

func disable_collision() -> void:
	$AnimationPlayer.stop()
	$PlayerSprite.visible = false
	$"Winged-bird-up".visible = false
	$"Bird-dead".visible = true
	$PlayerCollision.set_deferred("disabled", true)
