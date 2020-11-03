extends KinematicBody2D

# Unit is moving towards a given direction.

var vector_movement : VectorMovement
var to_position : Vector2

func _ready():
	vector_movement = get_node("VectorMovement")
	
func _physics_process(delta):
	var direction = to_position - position
	#print(direction)
	vector_movement.update_forward(direction)
	
	move_and_slide(vector_movement.forward * 1, Vector2(0,0))

func update_follow_position(p_position):
	to_position = p_position
	
