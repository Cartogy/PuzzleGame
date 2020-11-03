extends Node

class_name Follow

# Follow a position by returning the direction

var to_follow : Vector2

func _ready():
	pass
	
func get_direction_to(position: Vector2, p_to_follow: Vector2) -> Vector2:
	return (p_to_follow - position).normalized()
