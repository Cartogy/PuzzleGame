extends "res://Project/Classes/StateMachine/state.gd"

var flock: FlockManager

var initial_direction: Vector2
var box: Box

func _ready():
	flock = get_parent().get_parent()

func handle_input(event: InputEventKey):
	if event.is_action_released("key_action"):
		flock.flock()

func enter():
	# Ensure all units are push/pulling
	for e in flock.entities:
		e.push_pull()
	
func tick(delta):
	var direction = flock.direction_input.get_input()
	
	# Whether the direction is straight
	# 0 -> perpendicular
	# 1 -> parallel
	var dot_value: float = direction.dot(initial_direction)
	
	var push_pull_direction = initial_direction * flock.push_pull_force * dot_value
#	print_debug(push_pull_direction)
	# Pass to all entities
	for e in flock.entities:
		var unit: Unit = e
		unit.push_pull_direction = push_pull_direction
		
	# Box moves along the input direction
	box.move_and_slide(push_pull_direction, Vector2.ZERO)
	
func exit():
	pass

func get_state_type():
	return "PushPull"
