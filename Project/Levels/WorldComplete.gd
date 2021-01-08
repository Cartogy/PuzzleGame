extends Area2D

signal world_complete_entered
signal world_complete_exited

enum Pass_Critera { BOTH, EITHER}
export (Pass_Critera) var pass_critera = 0
export (String, FILE, "*.tscn") var next_world

func _on_WorldComplete_body_entered(body):
	emit_signal("world_complete_entered", body,pass_critera,next_world)

func _on_WorldComplete_body_exited(body):
	emit_signal("world_complete_exited", body)
