extends Node

func _ready():
	$StateMachine.initialize($StateMachine.START_STATE)

func _input(event):
	pass

func _physics_process(delta):
	pass
