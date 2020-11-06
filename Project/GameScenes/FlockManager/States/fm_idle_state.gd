extends "res://Project/Classes/StateMachine/state.gd"

var flock

func _ready():
	flock = get_parent().get_parent()

func handle_input(event):
	pass

func enter():
	for e in flock.entities:
		e.idle()
	
func tick(delta):
	pass
	
func exit():
	pass

func get_state_type():
	return "Idle"
