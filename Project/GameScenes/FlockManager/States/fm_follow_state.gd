extends "res://Project/Classes/StateMachine/state.gd"

var flock

func _ready():
	flock = get_parent().get_parent()
	

func handle_input(event):
	pass

func enter():
	print("[Flocking Manager] FOllowing")
	
	assert(flock.entities.size() > 0)
	for e in flock.entities:
		e.follow()
	
func tick(delta):
	pass
	
func exit():
	print("[Flocking Manager] FOllowing Exiting")

func get_state_type():
	return "Follow"
