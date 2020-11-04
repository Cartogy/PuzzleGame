extends Node

class_name Follow

var following : VectorMovement
var radius = 2

func _ready():
	pass
	
	

## Main function to calculate direction to follow
func direction_to_follow(p_position: Vector2, follow_position: Vector2) -> Vector2:
	var point_behind = point_behind_follow(follow_position, following.forward, radius)
	var direction_to_follow = direction_behind(p_position, point_behind)
	
	return direction_to_follow
	
# Gets the position behind an entity to move towards
func point_behind_follow(follow_position: Vector2, follow_forward: Vector2, radius: float) -> Vector2:
	var behind_direction = -(follow_forward * radius)	# Direction behind the following entity
	var behind_position = follow_position + behind_direction
	
	return behind_position
	
func direction_behind(p_position: Vector2, behind_follow_position: Vector2) -> Vector2:
	
	var direction = behind_follow_position - p_position
	var direction_n = direction.normalized()
	
	return direction_n
