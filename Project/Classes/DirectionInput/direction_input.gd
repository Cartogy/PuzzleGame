extends Node

# Responsible for managing input during the physics process.
# Meant to be used by Bodies that require input during the physics process function.

class_name DirectionInput

func get_input() -> Vector2:
	var direction = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0,1)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1,0)
	
	return direction.normalized()
