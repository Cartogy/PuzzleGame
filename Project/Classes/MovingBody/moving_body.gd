extends "res://Project/Classes/VectorMovement/vector_movement.gd"

var direction_input : DirectionInput

func _ready():
	direction_input = get_node("DirectionInput")

func _input(event):
	if event.is_action_pressed("key_action"):
		print("[Duck] Key action pressed")
		$KeyHolder.key_effect()

func _physics_process(delta):
	var direction = direction_input.get_input()
	update_forward(direction)
	
	print("[Duck forward]")
	print(forward)
	
	move_and_slide(forward * 200, Vector2(0,0))
	
func deactivate():
	self.set_physics_process(false)
	
func activate():
	self.set_physics_process(true)

func get_position() -> Vector2:
	return global_position
