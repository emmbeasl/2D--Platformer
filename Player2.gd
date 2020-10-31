extends KinematicBody2D

const UP = Vector2(0,-1)

var score = 0
var motion = Vector2()
export var speed = 200
export var gravity = 40
export var jump_force = -800

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_force
	else:
		$Sprite.play("Jump")
	motion = move_and_slide(motion, UP)

func _on_Coin1_body_entered(body):
	score += 10
	print(score)
