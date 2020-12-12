extends Node

class_name FlockManager

# Contain all entities that will serve as a horder

var entities = []
var direction_input : DirectionInput

var scale = 120		# How far away the direction is from the average_center
onready var target: Node2D = get_node(target_path)
export var target_path: = NodePath()

export var area_radius: float
export var push_pull_force: float

func _ready():
	direction_input = get_node("DirectionInput")
	var following = null
	for child in get_node("Flock").get_children():
		entities.append(child)
		child.set_target(target)
	
	# Area to interact via ducklings
	$Area2D/CollisionShape2D.scale.x = area_radius
	$Area2D/CollisionShape2D.scale.y = area_radius
			
	$StateMachine.initialize($StateMachine.START_STATE)
	
func _physics_process(delta):
	$StateMachine.tick(delta)
	$Area2D.position = get_position()

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
		
func flock():
	$StateMachine.change_state("Flock")

func idle():
	$StateMachine.change_state("Idle")
	
func push_pull(box: Box, initial_direction: Vector2):
	$StateMachine/PushPull.box = box
	$StateMachine/PushPull.initial_direction = initial_direction
	$StateMachine.change_state("PushPull")
#########################

func deactivate():
	for e in entities:
		e.set_physics_process(false)
		
func activate():
	for e in entities:
		e.set_physics_process(true)

func get_position() -> Vector2:
	return calculate_average_center(entities)
