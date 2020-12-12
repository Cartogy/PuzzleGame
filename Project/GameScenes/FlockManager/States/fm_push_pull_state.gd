extends "res://Project/Classes/StateMachine/state.gd"

var flock: FlockManager

var initial_direction: Vector2
var box: Box

func _ready():
	flock = get_parent().get_parent()

func handle_input(event):
	if event.is_action_just_pressed("key_action"):
		emit_signal("change_state", "Flock")

func enter():
	for e in flock.entities:
		e.push_pull()
	
func tick(delta):
	var direction = flock.direction_input.get_input()
	var dot_value: float = direction.dot(initial_direction)
	print(dot_value)
	
	for e in flock.entities:
		var unit: Unit = e
		unit.push_pull_direction = initial_direction * flock.push_pull_force * dot_value
		box.move_and_slide(initial_direction * flock.push_pull_force * dot_value)
	
func exit():
	pass

func get_state_type():
	return "PushPull"
