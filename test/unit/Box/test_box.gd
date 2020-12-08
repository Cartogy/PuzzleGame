extends "res://addons/gut/test.gd"

func test_valid_force():
	var box = Box.new()
	
	var force_1 = Vector2.UP
	var force_2 = Vector2.DOWN
	var force_3 = Vector2.LEFT
	var force_4 = Vector2.RIGHT
	
	assert_eq(box.valid_force(force_1), true)
	assert_eq(box.valid_force(force_2), true)
	assert_eq(box.valid_force(force_3), true)
	assert_eq(box.valid_force(force_4), true)
	
func test_invalid_force():
	
	var invalid_f_0 = Vector2(0.707, 0.707)
	var invalid_f_1 = Vector2(0.32, 0.68)
	var invalid_f_2 = Vector2(1, 1)
	
	var box = Box.new()
	
	assert_eq(box.valid_force(invalid_f_0), false)
	assert_eq(box.valid_force(invalid_f_1), false)
	assert_eq(box.valid_force(invalid_f_2), false)
