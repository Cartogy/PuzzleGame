extends "res://Project/Classes/StateMachine/state.gd"

var box: Box
var position_vector: Vector2	# the direction in which the player is looking at the box
var initial_direction: Vector2

onready var push_pull_force = get_node("../..").push_pull_force

func enter():
	print(initial_direction)
	
func exit():
	pass
	
func tick(delta):
	#var box_position = box.global_position
	var direction: Vector2 = get_parent().get_parent().direction_input.get_input()
	print("Forward:"+ str(initial_direction))
	var dot_value: float = direction.dot(initial_direction)
	print(dot_value)	
	
	#get_parent().get_parent().update_forward(direction)
	
	get_parent().get_parent().move_and_slide(initial_direction * push_pull_force * dot_value, Vector2(0,0))
	box.move_and_slide(initial_direction * push_pull_force * dot_value)
	
func handle_input(event):
	pass

func get_state_type() -> String:
	return "PushPull"

func set_initial_direction(direction: Vector2) -> void:
	if direction.length() != 0:
		initial_direction = direction
	
