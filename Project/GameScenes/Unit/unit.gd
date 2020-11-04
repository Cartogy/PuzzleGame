extends KinematicBody2D

# Unit is moving towards a given direction.

class_name Unit

var vector_movement : VectorMovement
var to_position : Vector2


func _ready():
	vector_movement = get_node("VectorMovement")
	
func _physics_process(delta):
	$StateMachine.tick(delta)

func update_follow_position(p_position: Vector2):
	to_position = p_position
	
func set_follow(following: VectorMovement) -> void:
	$Follow.following = following
	
