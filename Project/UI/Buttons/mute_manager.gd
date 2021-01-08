extends Control


#onready var packed_mute_off_button = load("res://UI/Buttons/MuteOffButton.tscn")
# Have Mute_off button be active in editor view
onready var packed_mute_on_button = load("res://Project/UI/Buttons/MuteOnButton.tscn")

var mute_on_button
var mute_off_button

# Allows for simple toggle behaviour
#enum MuteState { OFF, ON }
#var current_state

# Called when the node enters the scene tree for the first time.
func _ready():
	mute_on_button = packed_mute_on_button.instance()

	#mute_off_button = packed_mute_off_button.instance()
	mute_off_button = get_child(0)
	# Set margin
	mute_on_button.set_margin(MARGIN_TOP, mute_off_button.get_margin(MARGIN_TOP))
	mute_on_button.set_margin(MARGIN_BOTTOM, mute_off_button.get_margin(MARGIN_BOTTOM))
	mute_on_button.set_margin(MARGIN_RIGHT, mute_off_button.get_margin(MARGIN_RIGHT))
	mute_on_button.set_margin(MARGIN_LEFT, mute_off_button.get_margin(MARGIN_LEFT))

#	current_state = MuteState.OFF
	
	for _i in self.get_children():
		print_debug(_i)
		print_debug("mute_on_button: ",mute_on_button)
		print_debug("mute_off_button: ",mute_off_button)

func toggle():
	if SoundManager.audio_on == false:
#	match current_state:
#		MuteState.OFF:
			for _i in self.get_children():
				print_debug(_i)
			remove_child(mute_off_button)
			add_child(mute_on_button)
#			current_state = MuteState.ON
			volume_toggle()
#		MuteState.ON:
	else:
			for _i in self.get_children():
				print_debug(_i)
			remove_child(mute_on_button)
			add_child(mute_off_button)
#			current_state = MuteState.OFF
			volume_toggle()

func volume_toggle():
	ConfigManager.sound_on = !ConfigManager.sound_on
	ConfigManager.music_on = !ConfigManager.music_on
	SoundManager.audio_update()
	ConfigManager.save_config()
	SoundManager.set_volume()
	SoundManager.play_ui_button()
	print_debug("mute_on_button: ",mute_on_button)
	print_debug("mute_off_button: ",mute_off_button)
