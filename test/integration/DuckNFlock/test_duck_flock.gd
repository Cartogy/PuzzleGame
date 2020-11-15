extends "res://addons/gut/test.gd"

const TDuckNFlock = preload("res://Project/GameScenes/DuckNFlock/DuckNFlock.tscn")
const TFlockManager = preload("res://Project/GameScenes/FlockManager/FlockManager.tscn")


func test_duck_flock_start():
	var df = TDuckNFlock.instance()
	add_child(df)
	var df_fsm = df.get_node("Control").get_node("StateMachine")
	var flock_fsm = df.get_node("FlockManager").get_node("StateMachine")
	
	
	# Duck Control
	assert_eq(df_fsm.get_state("DuckControl"), df_fsm.current_state)
	
	# Duck Waddling Together
	assert_eq(df_fsm.current_state.get_node("StateMachine").get_state("WaddleTogether"), 
			df_fsm.current_state.get_node("StateMachine").current_state)
	
	# Flock Following
	assert_eq(flock_fsm.get_state("Follow"), flock_fsm.current_state)

