extends "res://Project/Classes/StateMachine/state.gd"

var flock: FlockManager

func _ready():
	flock = get_parent().get_parent()
	

func handle_input(event):
	if event.is_action_pressed("key_action"):
		interact()
		

func enter():
	#print_debug("[FlockingManager] Flocking")
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
	
func interact():
	var valid_effect = flock.get_node("KeyHolder").key_effect()
	
	# Other interaction
	if valid_effect == false:
		for u in flock.entities:
			var unit: Unit = u
			# Check for collisions
			if unit.get_slide_count() > 0:
				var possible_box = unit.get_slide_collision(0)
				# Ensure desired collision
				if possible_box.collider is Box:
					var box: Box = possible_box.collider
					# Reduce size of forward to have size 
					var forward = unit.forward.normalized().round()
					
					flock.push_pull(box, forward)
		
