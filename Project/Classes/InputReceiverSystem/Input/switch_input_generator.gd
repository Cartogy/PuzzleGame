extends "input_generator.gd"

var on_state = false
enum Switch_State { ON, OFF }

var bodies_on: Array

var current_state

func _ready():
	current_state = Switch_State.OFF
	match current_state:
		Switch_State.ON:
			turn_on()
		Switch_State.OFF:
			turn_off()

func pass_input(i: InputGenerator) -> void:
	change_state()
	
	if receiver != null:
		match current_state:
			Switch_State.ON:
				receiver.receive_input(self)
			Switch_State.OFF:
				receiver.remove_input(self)
	else:
		printerr("Receiver not set for Switch")

func change_state():
	var val_to_pass
	match current_state:
		Switch_State.OFF:
			turn_on()
			current_state = Switch_State.ON
		Switch_State.ON:
			turn_off()
			current_state = Switch_State.OFF
			
	return val_to_pass
	
func turn_on():
	$AnimatedSprite.play("On")
	
func turn_off():
	$AnimatedSprite.play("Off")


func _on_Area2D_body_entered(body):
	if current_state != Switch_State.ON:
		pass_input(self)
	bodies_on.append(body)


func _on_Area2D_body_exited(body):
	bodies_on.erase(body)
	if bodies_on.size() == 0:
		if current_state != Switch_State.OFF:
			pass_input(self)
