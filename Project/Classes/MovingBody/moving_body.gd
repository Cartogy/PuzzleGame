extends "res://Project/Classes/VectorMovement/vector_movement.gd"

var direction_input : DirectionInput

func _ready():
	direction_input = get_node("DirectionInput")

func _physics_process(delta):
	var direction = direction_input.get_input()
	update_forward(direction)
	
	move_and_slide(forward * 200, Vector2(0,0))
	
func deactivate():
	self.set_physics_process(false)
	
func activate():
	self.set_physics_process(true)
