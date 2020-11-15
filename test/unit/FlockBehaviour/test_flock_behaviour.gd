extends "res://addons/gut/test.gd"

const TFlockManager = preload("res://Project/GameScenes/FlockManager/flock_manager.gd")

func test_sum_of_positions():
	var fm = TFlockManager.new()
	var e1 = Node2D.new()
	e1.position = Vector2(5,0)
	var e2 = Node2D.new()
	e2.position = Vector2(2,4)
	var e3 = Node2D.new()
	e3.position = Vector2(8,5)
	
	var expected = [Vector2(15, 9), 3]
	var entities = [e1, e2, e3]
	
	assert_eq(fm.sum_of_positions(entities), expected)
	
func test_calculate_average_center():
	var fm = TFlockManager.new()
	var e1 = Node2D.new()
	e1.position = Vector2(6,0)
	var e2 = Node2D.new()
	e2.position = Vector2(2,4)
	var e3 = Node2D.new()
	e3.position = Vector2(8,5)
	
	var entities = [e1, e2, e3]
	
	var expected = Vector2(5,3)
	var value : Vector2 = fm.calculate_average_center(entities)
	value.x = stepify(value.x, 1.0)
	
	assert_eq(value, expected)
	
func test_calulate_new_position():
	var fm = TFlockManager.new()
	
	var avg_center = Vector2(0,0)
	var direction = Vector2(0,0)
	var scale = 5
	
	var expected = Vector2(0,0)
	
	assert_eq(fm.calculate_new_position(direction, avg_center, scale), expected)
	
func test_calulate_new_position_two():
	var fm = TFlockManager.new()
	
	var avg_center = Vector2(5,3)
	var direction = Vector2(0,0)
	var scale = 5
	
	var expected = Vector2(5,3)
	
	assert_eq(fm.calculate_new_position(direction, avg_center, scale), expected)
	
