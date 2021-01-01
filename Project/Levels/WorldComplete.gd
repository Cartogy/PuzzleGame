extends Area2D

signal level_complete(next_level)

enum Pass_Critera { BOTH, EITHER}
export (Pass_Critera) var pass_critera = 0

export (String, FILE, "*.tscn") var next_world

var game
var credits = "res://Project/GameScenes/EndCredits/EndCredits.tscn"
var duckPass = false
var ducklingPass = false

func _ready():
	game = null
	if game:
		self.connect("level_complete", game, "_on_World_Complete")

func _physics_process(delta):
	_on_World_Complete()

func duckAndDucklingPass():
	if duckPass and ducklingPass:
		change_world()

func duckOrDucklingPass():
	if duckPass or ducklingPass:
		change_world()
	
func change_world():
	if next_world:
		if game:
			emit_signal("level_complete", next_world)
		else:
			get_tree().change_scene(next_world)
	else:
		get_tree().change_scene(credits)

func _on_World_Complete():
	duckPass = false
	ducklingPass = false
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Duck":
			duckPass = true
		if body.get_parent().name == "Flock":
			ducklingPass = true
	if pass_critera == 0:
		duckAndDucklingPass()
	else:
		duckOrDucklingPass()
