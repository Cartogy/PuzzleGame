extends "res://addons/gut/test.gd"

var DInput = load("res://Project/Classes/DirectionInput/direction_input.gd")

func test_direction_input_down():
	var d_input = DInput.new()
	Input.action_press("ui_down")
	var value = d_input.get_input()
	var expected = Vector2(0, -1)
	
	assert_eq(value, expected)
	
func test_direction_input_up():
	var d_input = DInput.new()
	Input.action_press("ui_up")
	var value = d_input.get_input()
	var expected = Vector2(0, 1)
	
	assert_eq(value, expected)
	
func test_direction_input_right():
	var d_input = DInput.new()
	Input.action_press("ui_right")
	var value = d_input.get_input()
	var expected = Vector2(1,0)
	
	assert_eq(value, expected)
	
func test_direction_input_left():
	var d_input = DInput.new()
	Input.action_press("ui_left")
	var value = d_input.get_input()
	var expected = Vector2(-1,0)
	
	assert_eq(value, expected)
