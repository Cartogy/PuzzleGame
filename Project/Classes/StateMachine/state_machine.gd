extends Node

class_name StateMachine

var states = {}
var current_state

export (NodePath) var START_STATE

func _ready():
	for s in get_children():
		states[s.get_state_type()] = s
	initialize(START_STATE)

func _input(event):
	current_state.handle_input(event)

func tick(delta):
	var next_state = current_state.tick(delta)
	if next_state != null:
		change_state(next_state)
	
func change_state(state):
	current_state.exit()
	current_state = states[state]
	current_state.enter()

func initialize(start_state):
	current_state = states[get_node(start_state).get_state_type()]
	current_state.enter()
