extends Box

class_name PhysicsBox

func _physics_process(delta):
	var force = Vector2.ZERO
	"""
	move_and_slide(force, Vector2.ZERO)
	if get_slide_count() > 0:
		check_box_collision()
	"""
		
func check_box_collision() -> void:
	var entity : = get_slide_collision(0).collider as VectorMovement
	if valid_force(entity.forward):
		push(entity.forward)

func push(force: Vector2):
	move_and_slide(force * 100, Vector2.ZERO)
