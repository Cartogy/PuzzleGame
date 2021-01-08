extends Control

"""
Switches between mute on and mute off button by replacing the child with
the mute on/off based on toggle.
"""

#onready var packed_mute_off_button = load("res://UI/Buttons/MuteOffButton.tscn")
# Have Mute_off button be active in editor view
onready var packed_mute_on_button = load("res://Project/UI/Buttons/MuteOnButton.tscn")

var mute_on_button
var mute_off_button

# Called when the node enters the scene tree for the first time.
func _ready():
	mute_on_button = packed_mute_on_button.instance()

	mute_off_button = get_child(0)
	# Set margin
	mute_on_button.set_margin(MARGIN_TOP, mute_off_button.get_margin(MARGIN_TOP))
	mute_on_button.set_margin(MARGIN_BOTTOM, mute_off_button.get_margin(MARGIN_BOTTOM))
	mute_on_button.set_margin(MARGIN_RIGHT, mute_off_button.get_margin(MARGIN_RIGHT))
	mute_on_button.set_margin(MARGIN_LEFT, mute_off_button.get_margin(MARGIN_LEFT))

	# Incase music is stored as false
	if ConfigManager.music_on == false:
		show_mute_button()

func toggle():
	if ConfigManager.music_on == true:
			show_mute_button()
			volume_toggle()
	else:
			show_sound_button()
			volume_toggle()

func show_mute_button() -> void:
	remove_child(mute_off_button)
	add_child(mute_on_button)
	
func show_sound_button() -> void:
	remove_child(mute_on_button)
	add_child(mute_off_button)

func volume_toggle():
	ConfigManager.sound_on = !ConfigManager.sound_on
	ConfigManager.music_on = !ConfigManager.music_on
	SoundManager.audio_update()
	ConfigManager.save_config()
	SoundManager.set_volume()
	SoundManager.play_ui_button()
	print_debug("mute_on_button: ",mute_on_button)
	print_debug("mute_off_button: ",mute_off_button)
