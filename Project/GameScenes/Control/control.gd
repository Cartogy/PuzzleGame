extends Node

func _ready():
	get_parent().get_node("FlockManager").deactivate()

func _input(event):
	pass

func _physics_process(delta):
	pass
