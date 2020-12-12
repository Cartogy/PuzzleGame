extends Node

signal unpause

var game
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_owner().get_parent().name)
	game = get_owner().get_parent()
	
	self.connect("unpause", game, "change_state")
	self.connect("pressed", self, "_unpause_game")

func _unpause_game():
	print("Button Clicked")
	emit_signal("unpause")
