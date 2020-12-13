extends Node
"""
Allow to interact with the environtment
depending on what it collides with
"""
var collisions: Array

func _input(event):
	if event.is_action_pressed("key_action"):
		print_debug("[Duck] Key action pressed")
		interact()
	elif event.is_action_released("key_action"):
		stop_interacting()

func colliding(current_collisions: Array):
	collisions = current_collisions

func interact():
	var entity = get_parent().get_slide_collision(0)
	if entity is Box:
		get_parent().push_pull()
	else:
		get_parent().get_node("KeyHolder").key_effect()

func stop_interacting():
	var entity = get_parent().get_slide_collision(0)
	if entity is Box:
		get_parent().stop_push_pull()
