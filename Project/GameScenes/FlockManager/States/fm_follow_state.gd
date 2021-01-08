extends "res://Project/Classes/StateMachine/state.gd"

var flock

func _ready():
	flock = get_parent().get_parent()
	

func handle_input(event):
	pass

func enter():
	#print_debug("[Flocking Manager] FOllowing")
	
	
	if flock.entities.size() > 0:
		for e in flock.entities:
			e.follow()
	
func tick(delta):
	pass
	
func exit():
	#print_debug("[Flocking Manager] FOllowing Exiting")
	pass

func get_state_type():
	return "Follow"
