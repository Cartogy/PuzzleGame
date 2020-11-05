extends "res://Project/Classes/StateMachine/state.gd"


var control_entity
export (String) var transfer_state		# State to move to

signal switch_state

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("switch_state", get_parent(), "change_state")
	

func handle_input(event):
	if event.is_action_pressed("control_switch"):
		emit_signal("switch_state", transfer_state)
	return

func enter():
	pass
	
func tick(delta):
	pass
	
func exit():
	pass
