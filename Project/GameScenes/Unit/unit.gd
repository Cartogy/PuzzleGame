extends KinematicBody2D

# Unit is moving towards a given direction.

class_name Unit

var vector_movement : VectorMovement
var to_position : Vector2


func _ready():
	vector_movement = get_node("VectorMovement")
	
func _physics_process(delta) -> void:
	$StateMachine.tick(delta)

func update_follow_position(p_position: Vector2):
	to_position = p_position
	
# Following another unit
func set_follow(following: VectorMovement) -> void:
	$Follow.following = following
	
#########################
#   State Transitions   #
#########################

func follow():
	$StateMachine.change_state("Follow")
	
func flock():
	$StateMachine.change_state("Flock")
	
func idle():
	$StateMachine.change_state("Idle")

###########################
