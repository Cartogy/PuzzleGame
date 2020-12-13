extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var f: Node2D = Node2D.new()
	
	print_debug(f.get_class()) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
