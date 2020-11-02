extends "res://addons/gut/test.gd"

var VMovement = load("res://Project/Classes/VectorMove.tscn")

func test_forward_interpolation():
	var vector_movement = VMovement.Instance()
	var t_forward = Vector2(1,0)
	
	var t_direction_one = Vector2(0,1)
	var t_direction_two = Vector2(1,0)
	var t_direction_three = Vector2(1,1)
	
	var expected_one = Vector2(0,1)
	var expected_two = Vector2(1,0)
	var expected_three = Vector2(1,1)
	
	assert_eq(vector_movement.interpolate_forward(t_direction_one, t_forward), expected_one)
	assert_eq(vector_movement.interpolate_forward(t_direction_two, t_forward), expected_two)
	assert_eq(vector_movement.interpolate_forward(t_direction_three, t_forward), expected_three)
	
func test_forward_update():
	var vector_movement = VMovement.Instance()
	
	var t_direction = Vector2(0,1)
	
	var expected = Vector2(0,1)
	
	vector_movement.update_forward(t_direction)
	assert_eq(vector_movement.forward, expected)
