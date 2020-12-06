extends "res://Project/Classes/VectorMovement/vector_movement.gd"

# Unit is moving towards a given direction.

class_name Unit

var to_position: Vector2	# Used in flock movement
var target: Node2D 

const ARRIVE_THRESHOLD: = 100.0

var max_speed: = 500.0
var follow_offset: = 100.0

var _velocity: Vector2 = Vector2.ZERO


func _ready():
	._ready()
	$StateMachine.initialize($StateMachine.START_STATE)

func set_target(targ: Node2D) -> void:
	target = targ

func update_follow_position(p_position: Vector2):
	to_position = p_position
	
func _physics_process(delta) -> void:
	$StateMachine.tick(delta)
	
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
