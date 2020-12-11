extends "res://Project/Classes/StateMachine/state.gd"

func enter():
	pass
	
func exit():
	pass
	
func tick(delta):
	var direction = get_parent().get_parent().direction_input.get_input()
	
	get_parent().get_parent().current_direction = direction
	
	get_parent().get_parent().update_forward(direction)
	
	get_parent().get_parent().move_and_slide(get_parent().get_parent().forward * 200, Vector2(0,0))
	
func handle_input(event):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_state_type() -> String:
	return "Movement"
