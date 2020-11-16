extends "res://Project/Classes/StateMachine/state.gd"

var flock

func _ready():
	flock = get_parent().get_parent()
	

func handle_input(event):
	pass

func enter():
	print("[FlockingManager] Flocking")
	for e in flock.entities:
		e.flock()
	
func tick(delta):
	var avg_center = flock.calculate_average_center(flock.entities)
	var direction = flock.direction_input.get_input()
	
	# Get position from the avg center
	var new_position = flock.calculate_new_position(direction, avg_center, flock.scale)
	# Update new position to all entities
	for e in flock.entities:
		e.update_follow_position(new_position)
	
func exit():
	pass

func get_state_type():
	return "Flock"
