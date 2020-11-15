extends Node

class_name State

var state_type : String

func _ready():
	pass
	
#func handle_input(event):
#	print("Base State Input")
#	pass

func enter():
	pass
	
func tick(delta: float):
	pass

func exit():
	pass
	
func get_state_type():
	return state_type
	
func set_state_type(t: String) -> void:
	state_type = t
