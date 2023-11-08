extends KinematicBody2D

var speed = Game.SPEED
	
func _physics_process(_odeiopixel):
	var velocity = Vector2()
	
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
		
	move_and_slide(velocity)
	look_at(get_global_mouse_position())
