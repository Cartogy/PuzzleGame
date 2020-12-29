extends Node

onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer
onready var audio_on = false

var start_dir = ".."

var chirp_calm = load("res://Project/Audio/SFX/Chirps1.ogg")
var chirp_stress = load("res://Project/Audio/SFX/Chirps2.ogg")
var quack_angry = load("res://Project/Audio/SFX/Quack1.ogg")
var ui_button = load("res://Project/Audio/SFX/UIButton.ogg")
var game_switch = load("res://Project/Audio/SFX/Switch.ogg")
var quack_neutral = [
	load("res://Project/Audio/SFX/Quack2.ogg"),
	load("res://Project/Audio/SFX/Quack3.ogg") #secret quack
]

var main_theme = load("res://Project/Audio/Music/For_Duck's_Sake_(MENU)_1.1.wav")
var pause_theme = load("res://Project/Audio/Music/So_Ducked_Up_(PAUSE_MENU)1.1.wav")
var possible_music = load("res://Project/Audio/Music/Total_quack_job_(Gameplay)_1.2.wav")


enum Music_State { GAMEPLAY, PAUSE, MAIN_MENU, NONE}
var current_state

func _ready():
	randomize()
	audio_update()
	current_state = Music_State.NONE
	set_volume()
#	print_debug("Audio on? ",audio_on)

func audio_update():
	if ConfigManager.sound_on == true and ConfigManager.music_on  == true:
		audio_on = true
	else:
		audio_on = false

func play_gameplay_music():
	if current_state != Music_State.GAMEPLAY:	# Avoid replaying music after ever level
		music_player.stop()
		music_player.stream = possible_music
		music_player.play()
		current_state = Music_State.GAMEPLAY

#############################################
#    Only meant to be used during gameplay  #
#############################################
func play_pause_music():
	if current_state != Music_State.PAUSE:
		music_player.stop()
		music_player.stream = pause_theme
		music_player.play()
		current_state = Music_State.PAUSE

func stop_pause_music():
	music_player.stop()
	play_gameplay_music()

func play_chirp_calm():
	sound_player.stream = chirp_calm
	sound_player.play()

func play_chirp_stress():
	sound_player.stream = chirp_stress
	sound_player.play()

func play_quack_angry():
	sound_player.stream = quack_angry
	sound_player.play()

func play_quack_neutral():
	var temp = floor(rand_range(0, 10))
	if temp < 9:
		sound_player.stream = quack_neutral[0]
	else:
		sound_player.stream = quack_neutral[1] #secret quack
	sound_player.play()

func play_ui_button():
	sound_player.stream = ui_button
	sound_player.play()

func play_game_switch():
	sound_player.stream = game_switch
	sound_player.play()

func play_theme():
	if current_state != Music_State.MAIN_MENU:
		music_player.stream = main_theme
		music_player.play()
		
		current_state = Music_State.MAIN_MENU

func set_volume():
	if ConfigManager.sound_on:
		music_player.volume_db = -15
		sound_player.volume_db = -15
	else:
		music_player.volume_db = -80
		sound_player.volume_db = -80
