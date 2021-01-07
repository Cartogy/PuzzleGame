extends Node

signal unpause

var game

func _ready():
	game = get_owner().get_parent()
	
	self.connect("unpause", game, "change_state")
	self.connect("pressed", self, "restart")

func restart():
	SoundManager.play_ui_button()
	get_tree().reload_current_scene()
	emit_signal("unpause")
