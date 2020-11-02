extends Node

class_name VectorMovement

var forward: Vector2	# vector that entity follows

func _ready():
	forward = Vector2(0,0)	# Face right on start

func interpolate_forward(direction: Vector2, p_forward: Vector2) -> Vector2:
	var new_forward = p_forward.linear_interpolate(direction, 1.0)
	
	return new_forward
	
func update_forward(direction: Vector2):
	forward = interpolate_forward(direction, forward)
