extends Node

enum World_State { INGAME, PAUSE }
var current_state

var pause_ui

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = World_State.INGAME
	pause_ui = get_node("PauseMenu")
	pause_ui.visible = true
	pause_ui.focus_mode = pause_ui.FOCUS_NONE
	remove_child(pause_ui)

func _input(event):
	if Input.is_action_just_pressed("pause_menu"):
		change_state()
		
func enable_game():
	set_level(false)
	
func disable_game():
	set_level(true)
	
func set_level(status: bool):
	get_tree().paused = status
	
func change_state():
	print("Changing State")
	match current_state:
		World_State.INGAME:
			add_child(pause_ui)
			current_state = World_State.PAUSE
			disable_game()
		World_State.PAUSE:
			remove_child(pause_ui)
			current_state = World_State.INGAME
			enable_game()

