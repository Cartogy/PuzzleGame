extends "res://Project/Classes/StateMachine/state.gd"

var unit: Unit
var flock_mechanic: FlockBehaviour


func _ready():
	unit = get_parent().get_parent()
	flock_mechanic = unit.get_node("Flock")

func enter() -> void:
	if unit.is_physics_processing() == false:
		unit.set_physics_process(true)
	
func handle_input(event):
	pass
	
func tick(delta: float):
	var direction = unit.to_position - unit.global_position
	unit.update_forward(direction)
	
	unit.get_node("DirectionalAnimation").direction_animation(unit.forward)
	unit.move_and_slide(unit.forward * 2, Vector2(0,0))
	
func exit() -> void:
	pass
	
func get_state_type():
	return "Flock"
