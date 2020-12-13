extends "receiver.gd"

class_name ConsumerReceiver

export (Array, NodePath) var inputs_to_receive
export (bool) var hold	# If input has to be held to activate it


var inputs: Array
var threshold: int	# Determines when to apply effect

func _ready():
	for i in inputs_to_receive:
		var i_node: InputGenerator = get_node(i)
		i_node.set_receiver(self)
	threshold = inputs_to_receive.size()



func receive_input(i: InputGenerator):
	if i != null:
		inputs.append(i)
		if inputs.size() >= threshold:
			if activated == false:
				activated = true
				current_state = effect(current_state)
	
	
func remove_input(i: InputGenerator):
	inputs.erase(i)
	if inputs.size() == threshold - 1:
		if activated && hold:
			activated = false
			# the threshold was just missed (e.g. 7 = 8-1, 
			# where 8 is the threshold to activate effect 
			current_state = effect(current_state)
