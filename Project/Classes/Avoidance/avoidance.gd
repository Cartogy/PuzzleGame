extends Area2D

# Calculates the avoidance vector

var neighbours = []
var parent
var collision_area : CollisionShape2D

func _ready():
	parent = get_parent()
	collision_area = get_node("CollisionShape2D")
		
		
func get_avoidance_vector() -> Vector2:
	
	var avoidance_v = total_avoidance_vector(parent.position, neighbours, collision_area.shape.radius)
	
	return avoidance_v

# Calculates the normalized avoidance vector
func total_avoidance_vector(p_position: Vector2, p_neighbours: Array, min_distance: float) -> Vector2:
	var av_v = Vector2(0,0)
	for n in p_neighbours:
		var new_av_v = avoidance_vector(p_position, n.position, min_distance)
		
		av_v += new_av_v

	return av_v.normalized()

func avoidance_vector(p_position: Vector2, n_position: Vector2, min_distance: float) -> Vector2:
	var direction : Vector2 = (n_position - p_position)
	return -direction



func _on_Avoidance_body_entered(body):
	
	if body != self.parent:
		neighbours.append(body)

func _on_Avoidance_body_exited(body):
	if body != self.parent:
		neighbours.erase(body)
