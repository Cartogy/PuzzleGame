extends "input_generator.gd"

class_name Key
var receiver: Receiver

func _ready():
	pass

func pass_input(i: InputGenerator) -> void:
	receiver.receive(self)

func destroy():
	queue_free()
	
func deactivate_collision():
	$StaticBody2D/CollisionShape2D.disabled = true
	
func activate_collision():
	$StaticBody2D/CollisionShape2D.disabled = false
	
func set_receiver(r: Receiver) -> void:
	receiver = r
