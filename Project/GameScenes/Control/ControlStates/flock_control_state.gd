extends "../control_state.gd"

export (NodePath) var flock_path

# Called when the node enters the scene tree for the first time.
func _ready():
	if flock_path == null:
		printerr("Path to entity: NULL")
	control_entity = get_node(flock_path)

func handle_input(event):
	if event.is_action_pressed("control_switch"):
		emit_signal("switch_state", transfer_state)

func enter():
	control_entity.activate()
	control_entity.flock()
	control_entity.set_physics_process(true)
	
func tick(_delta):
	pass
	
func exit():
	control_entity.idle()
	control_entity.deactivate()

func get_state_type():
	return "FlockControl"
