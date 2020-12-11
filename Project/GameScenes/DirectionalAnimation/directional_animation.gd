extends AnimatedSprite

func direction_animation(direction: Vector2) -> void:
	var angle = $RayCast2D.get_cast_to().angle_to(direction)
	if direction.x < 0:
		flip_h = true
	else:
		flip_h = false
	
	# Apply Directional Animation based on vertical orientation
	if direction.y < 0:
		vertical_animation("North", angle, null)
		# Top
	else:	# Bottom
		vertical_animation("South", angle, null)

func vertical_animation(orientation: String, angle: float, player: AnimationPlayer):
	# Specified an animation player
	var anim 
	if player == null:
		anim = self
	if in_between_degrees(angle, 0, 15.0):
		anim.play("East")
	elif in_between_degrees(angle, 16.0, 75.0):
		anim.play(orientation+"_East")
	elif in_between_degrees(angle, 75.1, 105.0):
		anim.play(orientation)
	elif in_between_degrees(angle, 105.1, 150):
		anim.play(orientation+"_West")
	elif in_between_degrees(angle, 150.1, 180.0):
		anim.play("West")

func in_between_degrees(angle: float, minimum: float, maximum: float) -> bool:
	if minimum <= angle and angle <= maximum:
		return true
	else:
		return false
