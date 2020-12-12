extends Node

class_name Receiver

var on_effect
var off_effect

enum Effect_State { ON, OFF}
export (Effect_State) var current_state

var activated: bool

func _ready():
	activated = false
	
	on_effect = $Effects/On
	off_effect = $Effects/Off
	
	match current_state:
		Effect_State.ON:
			on_effect.play_effect()
		Effect_State.OFF:
			off_effect.play_effect()

func receive_input(i) -> void:
	pass
	
func effect(state):
	match state:
		Effect_State.ON:
			off_effect.play_effect()
			state = Effect_State.OFF
		Effect_State.OFF:
			on_effect.play_effect()
			state = Effect_State.ON
	return state
	
