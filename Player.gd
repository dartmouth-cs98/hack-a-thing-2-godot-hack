extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800

var velocity : Vector2 = Vector2()

onready var sprite : AnimatedSprite = $Sprite

func _physics_process(delta):
	velocity.x = 0
	velocity.y
	
	# movement inputs
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		sprite.flip_h = true
		sprite.play("walk")
	elif Input.is_action_pressed("move_right"):
		velocity.x += speed
		sprite.flip_h = false
		sprite.play("walk")
	else:
		sprite.play("stand")

	# applying velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# gravity
	velocity.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= jumpForce
	
	if not is_on_floor():
		sprite.play("jump")
	
	# sprite animation
	if velocity.x != 0:
		sprite.play()
	else:
		sprite.stop()
