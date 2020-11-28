extends "receiver.gd"

class_name DestroyerReceiver

var key: InputGenerator

func receive_input(i: InputGenerator) -> void:
	if valid_input(i):
		i.destroy()
		effect(current_state)

func valid_input(i: InputGenerator) -> bool:
	if i == key:
		return true
	else:
		return false
