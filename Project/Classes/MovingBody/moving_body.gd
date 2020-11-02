extends KinematicBody2D

var movement : VectorMovement
var direction_input : DirectionInput

func _ready():
	movement = get_node("VectorMovement")
	direction_input = get_node("DirectionInput")

func _physics_process(delta):
	var direction = direction_input.get_input()
	movement.update_forward(direction)
	
	move_and_slide(movement.forward * 200, Vector2(0,0))
	
