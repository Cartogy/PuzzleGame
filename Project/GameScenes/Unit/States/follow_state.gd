extends "res://Project/Classes/StateMachine/state.gd"

var unit: Unit
var follow_mechanic: Follow

func _ready():
	unit = get_parent().get_parent()
	follow_mechanic = unit.get_node("Follow")

func enter() -> void:
	print_debug("[Unit] Following")
	if unit.is_physics_processing() == false:
		unit.set_physics_process(true)

func handle_input(event):
	pass

func tick(delta: float):
	var target_global_position: Vector2 = unit.target.global_position

	var to_target = unit.global_position.distance_to(target_global_position)
	if to_target < unit.ARRIVE_THRESHOLD:
		return

	var follow_global_position: Vector2 = (
		target_global_position - (target_global_position - unit.global_position).normalized() * unit.follow_offset
		if to_target > unit.follow_offset
		else unit.global_position
	)
	#follow_hint.global_position = follow_global_position


	unit._velocity = Steering.arrive_to(
		unit._velocity,
		unit.global_position,
		follow_global_position,
		unit.max_speed,
		200.0,
		10.0
	)
	unit._velocity = unit.move_and_slide(unit._velocity)
	get_parent().get_parent().get_node("DirectionalAnimation").direction_animation(unit._velocity)
	#sprite.rotation = _velocity.angle()
	
	return null
	
func exit() -> void:
	pass

func get_state_type():
	return "Follow"
