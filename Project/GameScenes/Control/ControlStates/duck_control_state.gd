extends "../control_state.gd"

export (NodePath) var duck_path

# Called when the node enters the scene tree for the first time.
func _ready():
	if duck_path == null:
		printerr("Path to entity: NULL")
	control_entity = get_node(duck_path)

func handle_input(event):
	.handle_input(event)

func _physics_process(delta):
	pass

func enter():
	control_entity.activate()
	$StateMachine.set_process_input(true)
	print($StateMachine.is_processing_input())
	
func exit():
	control_entity.deactivate()
	#$StateMachine.set_block_signals(true)
	$StateMachine.set_process_input(false)
	print($StateMachine.is_processing_input())

func get_state_type():
	return "DuckControl"
