extends "res://addons/gut/test.gd"


func test_point_behind():
	var follow = Follow.new()
	
	var expected = Vector2(2,1)
	
	# test values
	var follow_pos = Vector2(2,2)
	var follow_forward = Vector2(0,1)
	var radius = 1
	
	var value = follow.point_behind_follow(follow_pos, follow_forward, radius)
	
	assert_eq(value, expected)

func test_direction_behind():
	var follow = Follow.new()
	
	var expected = Vector2(2,1).normalized()
	
	# test values
	var test_position_behind = Vector2(2,1)
	var test_p_position = Vector2(0,0)
	
	var value = follow.direction_behind(test_p_position, test_position_behind)
	
	assert_eq(value, expected)
	
	
