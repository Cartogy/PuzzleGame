extends "res://Project/Classes/StateMachine/state.gd"

var unit: Unit
var flock_mechanic: FlockBehaviour


func _ready():
	unit = get_parent().get_parent()

func enter() -> void:
	pass
	
func handle_input(event):
	pass
	
func tick(delta: float):
	
	
	unit.move_and_slide(unit.push_pull_direction, Vector2.ZERO)
	
func exit() -> void:
	pass
	
func get_state_type():
	return "PushPull"
