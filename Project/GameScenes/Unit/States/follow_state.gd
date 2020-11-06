extends "res://Project/Classes/StateMachine/state.gd"

var unit: Unit
var follow_mechanic: Follow

func _ready():
	unit = get_parent().get_parent()
	follow_mechanic = unit.get_node("Follow")

func enter() -> void:
	if unit.is_physics_processing() == false:
		unit.set_physics_process(true)

func handle_input(event):
	pass

func tick(delta: float):
	if follow_mechanic.following != null:
		var follow_position = follow_mechanic.following.get_parent().position
		var direction = follow_mechanic.direction_to_follow(unit.position, follow_position)

		unit.vector_movement.update_forward(direction)
		unit.move_and_slide(unit.vector_movement.forward * 110, Vector2(0,0))
	
	return null
	
func exit() -> void:
	pass

func get_state_type():
	return "Follow"