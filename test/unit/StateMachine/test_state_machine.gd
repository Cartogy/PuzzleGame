extends "res://addons/gut/test.gd"

var FStateMachine = preload("res://Project/Classes/StateMachine/state_machine.gd")
var FState = preload("res://Project/Classes/StateMachine/state.gd")

func test_state_machine_adding_states():
	var fsm = FStateMachine.new()
	
	# Dummy states
	var state_0 = FState.new()
	state_0.set_state_type("State0")
	var state_1 = FState.new()
	state_1.set_state_type("State1")
	var state_2 = FState.new()
	state_2.set_state_type("State2")
	
	fsm.add_state(state_0)
	fsm.add_state(state_1)
	fsm.add_state(state_2)
	
	# Contains State 1
	assert_eq(true, fsm.states.has("State0"))
	assert_eq(true, fsm.states.has("State1"))
	assert_eq(true, fsm.states.has("State2"))

func test_state_machine_change_states():
	var fsm = dummy_fsm()
	
	fsm.current_state = fsm.get_state("State0")
	
	fsm.change_state("State1")
	assert_eq(fsm.get_state("State1"), fsm.current_state)
	
	fsm.change_state("State2")
	assert_eq(fsm.get_state("State2"), fsm.current_state)
	
	fsm.change_state("State3")
	assert_eq(fsm.get_state("State3"), fsm.current_state)
	
	# No state, stay in previous state
	fsm.change_state("State4")
	assert_eq(fsm.get_state("State3"), fsm.current_state)
	
func dummy_fsm() -> StateMachine:
	var fsm = FStateMachine.new()
	
	var state_0 = FState.new()
	state_0.set_state_type("State0")
	var state_1 = FState.new()
	state_1.set_state_type("State1")
	var state_2 = FState.new()
	state_2.set_state_type("State2")
	var state_3 = FState.new()
	state_3.set_state_type("State3")

	fsm.add_state(state_0)
	fsm.add_state(state_1)
	fsm.add_state(state_2)
	fsm.add_state(state_3)
	
	return fsm
