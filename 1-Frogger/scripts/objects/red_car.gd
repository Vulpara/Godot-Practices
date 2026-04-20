extends Area2D

var direction : Vector2 = Vector2.RIGHT
var speed : int = 160

func _ready() -> void:
	if direction == Vector2.LEFT:
		$Graph.flip_h = true

func _process(delta: float) -> void:
	position += speed * direction * delta
	boundary_check()

# 边界检查，出了边界就清除
func boundary_check() -> void:
	if position.x < -20 or position.x > 490:
		queue_free()
