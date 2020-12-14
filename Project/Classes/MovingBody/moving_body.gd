extends "res://Project/Classes/VectorMovement/vector_movement.gd"

var direction_input : DirectionInput
var collision_velocity: Vector2		# Used by the Box interaction
var current_direction

export (int) var push_pull_force = 100

func _ready():
	direction_input = get_node("DirectionInput")
	$StateMachine.initialize($StateMachine.START_STATE)

func _input(event):
	if event.is_action_pressed("key_action"):
		interact()
	elif event.is_action_released("key_action"):
		if $StateMachine.current_state == $StateMachine/PushPull:
			$StateMachine.change_state("Movement")

func _physics_process(delta):
	$StateMachine.tick(delta)
	
	"""
	current_direction = direction_input.get_input()
	update_forward(current_direction)
	
	collision_velocity = move_and_slide(forward * 200, Vector2(0,0))
	"""
	
func deactivate():
	self.set_physics_process(false)
	$DirectionalAnimation/AnimationPlayer.stop()
	
func activate():
	self.set_physics_process(true)

func get_position() -> Vector2:
	return global_position
	
func interact():
	
	var valid_key_interaction = $KeyHolder.key_effect()
	# Other interaction
	if valid_key_interaction == false:
		if get_slide_count() > 0:
			var entity = get_slide_collision(0)
			if entity.collider is Box:
				$StateMachine/PushPull.box = entity.collider as Box
				$StateMachine/PushPull.set_initial_direction(forward)
				$StateMachine.change_state("PushPull")
				
