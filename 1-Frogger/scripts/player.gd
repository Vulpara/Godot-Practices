extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO
var speed : int = 200

# 物理进程，同process函数一样，每秒运行60次
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animation()
	move_and_slide()

# 动画函数
func animation() -> void:
	if direction != Vector2.ZERO:
		match direction:
			Vector2.RIGHT:
				$AnimatedSprite2D.play("GoRight")
			Vector2.LEFT:
				$AnimatedSprite2D.play("GoLeft")
			Vector2.UP:
				$AnimatedSprite2D.play("GoUp")
			Vector2.DOWN:
				$AnimatedSprite2D.play("GoDown")
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0
		
