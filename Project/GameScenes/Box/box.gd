extends KinematicBody2D
class_name Box

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func push(velocity: Vector2) -> void:
	print_debug("Push not implemented in %s" % filename)

func valid_force(force_v: Vector2) -> bool:
	if force_v.length() == 1:
		return true
	else:
		return false
