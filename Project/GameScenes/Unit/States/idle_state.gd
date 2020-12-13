extends "res://Project/Classes/StateMachine/state.gd"

var unit: Unit
var flock_mechanic: FlockBehaviour


func _ready():
	unit = get_parent().get_parent()
	flock_mechanic = unit.get_node("Flock")

func enter() -> void:
	#print_debug("[Unit] Idle")
	if unit.is_physics_processing():
		unit.set_physics_process(false)
	
func handle_input(event):
	pass
	
func tick(delta: float):
	return
	
func exit() -> void:
	pass
	
func get_state_type():
	return "Idle"
