extends Node2D

var green_car_scene : PackedScene = preload("res://scenes/objects/green_car.tscn")
var red_car_scene : PackedScene = preload("res://scenes/objects/red_car.tscn")
var yellow_car_scene : PackedScene = preload("res://scenes/objects/yellow_car.tscn")

func _on_car_timer_timeout() -> void:
	# 实例化小车
	var green_car = green_car_scene.instantiate() as Area2D
	var red_car = red_car_scene.instantiate() as Area2D
	var yellow_car = yellow_car_scene.instantiate() as Area2D
	var car_color = randi() % 3
	var car = green_car
	if car_color == 0:
		car = red_car
	elif car_color == 1:
		car = yellow_car
	
	# 随机生成一个方向，指定小车向左还是向右
	var car_direction = randi() % 2
	if car_direction == 0:
		var cars_go_left = $CarsStartMark/GoLeft.get_children().pick_random() as Marker2D
		car.position = cars_go_left.position
		car.direction = Vector2.LEFT
	else:
		var cars_go_right = $CarsStartMark/GoRight.get_children().pick_random() as Marker2D
		car.position = cars_go_right.position
		car.direction = Vector2.RIGHT

	# 将小车添加到主场景中
	$Objects.add_child(car)

	# 创建连接信号，第一个参数为信号名，第二个参数为调用的函数名
	# 当触发信号时，会自动调用函数，并传一个Node2D类型的参数body
	car.connect("body_entered", game_over)


func game_over(body) -> void:
	print("你碰到了车，游戏结束")
