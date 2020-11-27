extends "res://Project/Classes/InputReceiverSystem/Effects/effect.gd"

var parent

func _ready():
	parent = get_parent().get_parent()

func play_effect():
	parent.get_node("AnimatedSprite").play("Closed")
	parent.get_node("StaticBody2D/CollisionShape2D").set_deferred("disabled", false)
