extends Node

var credits = "res://Project/GameScenes/EndCredits/EndCredits.tscn"
var duckPass = false
var ducklingPass = false

func _ready():
	for wc in self.get_children():
		wc.connect("world_complete_entered", self, "_on_WorldComplete_entered")
		wc.connect("world_complete_exited", self, "_on_WorldComplete_exited")
		
func duckAndDucklingPass(next_world):
	if duckPass and ducklingPass:
		change_world(next_world)

func duckOrDucklingPass(next_world):
	if duckPass or ducklingPass:
		change_world(next_world)
	
func change_world(next_world):
	if next_world:
		get_tree().change_scene(next_world)
	else:
		get_tree().change_scene(credits)

func _on_WorldComplete_entered(body,pass_critera,next_world):
	if body.name == "Duck":
		duckPass = true
	if body.get_parent().name == "Flock":
		ducklingPass = true
	if pass_critera == 0:
		duckAndDucklingPass(next_world)
	elif pass_critera == 1:
		duckOrDucklingPass(next_world)

func _on_WorldComplete_exited(body):
	if body.name == "Duck":
		duckPass = false
	if body.get_parent().name == "Flock":
		ducklingPass = false
