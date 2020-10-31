extends KinematicBody2D

export var EnemySpeed = 70
export var EnemyMotion = Vector2()
export var Gravity= 10

var EnemyDirection = 1
var UP= Vector2(0,-1)
var OppositeDirection = -1

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	EnemyMotion.y += Gravity
	if is_on_wall():
		EnemyDirection = EnemyDirection * OppositeDirection
	if EnemyDirection == 1:
		$Sprite.flip_h = true
	elif EnemyDirection == -1:
		$Sprite.flip_h = false
	EnemyMotion.x = EnemyDirection * EnemySpeed
	EnemyMotion = move_and_slide(EnemyMotion, UP)
