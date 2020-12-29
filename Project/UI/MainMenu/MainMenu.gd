extends Node

func _ready():
#	print_debug("Sound Manager Current State: ",SoundManager.Music_State.keys()[SoundManager.current_state],
#	" (", SoundManager.current_state, ")")
	SoundManager.play_theme()
	
	ConfigManager.save_config()
