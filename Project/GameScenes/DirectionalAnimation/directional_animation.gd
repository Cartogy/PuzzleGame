extends AnimatedSprite

"""
Requires an AnimationPlayer as a child
"""

func direction_animation(direction: Vector2) -> void:
	var angle = rad2deg(direction.angle_to($RayCast2D.get_cast_to()))
	
	# Apply Directional Animation based on vertical orientation
	if direction.length() == 0:
		$AnimationPlayer.stop()
	else:
		if direction.y < 0:
			vertical_animation("North", angle, $AnimationPlayer)
			# Top
		else:	# Bottom
			# have angle be converted to positive
			# As the direction is already accounted for using "direction.y < 0"
			vertical_animation("South", angle * -1, $AnimationPlayer)

func vertical_animation(orientation: String, angle: float, player: AnimationPlayer):
	# Specified an animation player
	var anim 

	
	if player == null:
		anim = self
	else:
		anim = player
	if in_between_degrees(angle, 0, 15.0):
		anim.play("East")
	elif in_between_degrees(angle, 16.0, 75.0):
		anim.play(orientation+"_East")
	elif in_between_degrees(angle, 75.1, 105.0):
		anim.play(orientation)
	elif in_between_degrees(angle, 105.1, 150):
		anim.play(orientation+"_West")
	elif in_between_degrees(angle, 150.1, 185.0):
		anim.play("West")

func in_between_degrees(angle: float, minimum: float, maximum: float) -> bool:
	if minimum <= angle and angle <= maximum:
		return true
	else:
		return false
