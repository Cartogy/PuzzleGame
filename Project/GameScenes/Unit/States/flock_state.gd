extends "res://Project/Classes/StateMachine/state.gd"

var unit: Unit
var flock_mechanic: FlockBehaviour
var avoidance


func _ready():
	unit = get_parent().get_parent()
	flock_mechanic = unit.get_node("Flock")
	
	avoidance = unit.get_node("Avoidance")

func enter() -> void:
	pass
	
func handle_input(event):
	pass
	
func tick(delta: float):
	## Get direction
	var direction = unit.to_position - unit.position
		
	#var avoidance_v = avoidance.get_avoidance_vector()
	#direction += avoidance_v * 55

	unit.vector_movement.update_forward(direction)
	unit.move_and_slide(unit.vector_movement.forward * 6, Vector2(0,0))
	
func exit() -> void:
	pass
	
func get_state_type():
	return "Flock"
