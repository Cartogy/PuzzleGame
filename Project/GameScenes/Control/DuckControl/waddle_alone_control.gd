extends "../control_state.gd"

# Have control state contain the switches and state to transition towards

export (NodePath) var duck_path
export (NodePath) var flock_path

var flock
var duck

func _ready():
	duck = get_node(duck_path)
	flock = get_node(flock_path)

func handle_input(event):
	.handle_input(event)

func enter():
	flock.idle()
	
func exit():
	pass

func get_state_type():
	return "WaddleAlone"

func play_transition_sound():
	SoundManager.play_quack_angry()
