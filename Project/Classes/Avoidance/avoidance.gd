extends Area2D

# Calculates the avoidance vector

var neighbours = []

func _ready():
	pass # Replace with function body.

# Calculates the avoidance vector
func total_avoidance_vector(p_position: Vector2, neighbours: Array, min_distance: float) -> Vector2:
	var av_v = Vector2(0,0)
	for n in neighbours:
		av_v + avoidance_vector(p_position, n.position, min_distance)
		
	return av_v

func avoidance_vector(p_position: Vector2, n_position: Vector2, min_distance: float) -> Vector2:
	
