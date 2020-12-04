extends "receiver.gd"

class_name DestroyerReceiver

export (NodePath) var key_path

var key

func _ready():
	key = get_node(key_path)

func receive_input(i: InputGenerator) -> void:
	effect(current_state)

func valid_input(i: InputGenerator) -> bool:
	if i == key:
		return true
	else:
		return false
