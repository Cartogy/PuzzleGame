extends Node

var duck_fsm : StateMachine
var control_fsm : StateMachine

func _ready():
	duck_fsm = get_parent().get_node("StateMachine")
	control_fsm = get_parent().get_node("StateMachine/Duck/StateMachine")

func _process(delta):
	if duck_fsm.current_state != null:
		$VBoxContainer/DuckLabel.text = duck_fsm.current_state.get_state_type()
	if control_fsm.current_state != null:
		$VBoxContainer/ControlLabel.text = control_fsm.current_state.get_state_type()
	
