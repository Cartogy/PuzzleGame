extends "input_generator.gd"

func _ready():
	pass

func pass_input(i: InputGenerator) -> void:
	receiver.receive(self)

func destroy():
	queue_free()
