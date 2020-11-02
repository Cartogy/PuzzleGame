extends "res://addons/gut/test.gd"

var DInput = load("res://Project/Classes/DirectionInput/direction_input.gd")

func test_direction_input_down():
	var d_input = DInput.new()
	var k = InputEventKey.new()
	k.scancode = KEY_DOWN
	k.pressed = true
	Input.parse_input_event(k)
	var value = d_input.get_input()
	var expected = Vector2(0, 1).normalized()
	
	assert_eq(value, expected)
	
func test_direction_input_up():
	var d_input = DInput.new()
	
	var k = InputEventKey.new()
	k.scancode = KEY_UP
	k.pressed = true
	Input.parse_input_event(k)
	
	var value = d_input.get_input()
	var expected = Vector2(0, -1).normalized()
	
	assert_eq(value, expected)
	
	d_input.queue_free()
	
func test_direction_input_right():
	var d_input = DInput.new()
	
	var k = InputEventKey.new()
	k.scancode = KEY_RIGHT
	k.pressed = true
	Input.parse_input_event(k)
	
	var value = d_input.get_input()
	var expected = Vector2(1,0).normalized()
	
	assert_eq(value, expected)
	
func test_direction_input_left():
	var d_input = DInput.new()
	
	var k = InputEventKey.new()
	k.scancode = KEY_LEFT
	k.pressed = true
	Input.parse_input_event(k)
	
	var value = d_input.get_input()
	var expected = Vector2(-1,0).normalized()
	
	assert_eq(value, expected)
