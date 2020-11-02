extends KinematicBody2D

onready var movement = get_node("VectorMovement")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		movement.update_forward(Vector2(0,1))
	if Input.is_action_pressed("ui_up"):
		movement.update_forward(Vector2(0,-1))
	
	move_and_slide(movement.forward * 20, Vector2(0,0))
