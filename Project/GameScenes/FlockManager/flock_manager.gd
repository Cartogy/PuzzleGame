extends Node

class_name FlockManager

# Contain all entities that will serve as a horder

var entities = []
var direction_input : DirectionInput

var scale = 120		# How far away the direction is from the average_center

func _ready():
	direction_input = get_node("DirectionInput")
	var following = null
	for child in get_node("Flock").get_children():
		entities.append(child)
		if following == null:
			following = child
		else:
			child.set_follow(following)
			following = child
		
	
func _physics_process(delta):
	$StateMachine.tick(delta)


######################################
## Functions to calculate positions ##
######################################

func calculate_new_position(p_direction: Vector2, p_avg_center: Vector2, p_scale: int) -> Vector2:
	return p_avg_center + (p_direction * p_scale)

func calculate_average_center(p_entities: Array) -> Vector2:
	var tuple = sum_of_positions(p_entities)
	
	# Indices to access the tuple
	var i_sum = 0
	var i_count = 1
	
	var avg_center = tuple[i_sum] / tuple[i_count]
	return avg_center
	
# Returns a tuple containing the sum and number of entities.
func sum_of_positions(p_entities: Array) -> Array:
	var count = 0
	var sum = Vector2(0,0)
	
	for e in p_entities:
		sum += e.position
		count += 1
		
	var tuple = [sum, count]
		
	return tuple
	
########################
#   State Transitions  #
########################
func follow():
	$StateMachine.change_state("Follow")
	print("Flock Follow")
		
func flock():
	$StateMachine.change_state("Flock")

func idle():
	$StateMachine.change_state("Idle")
#########################

func deactivate():
	for e in entities:
		e.set_physics_process(false)
		
func activate():
	for e in entities:
		e.set_physics_process(true)
