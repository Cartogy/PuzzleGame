extends Node

var near_key: Key

var key: Key
var lock: DestroyerReceiver

func _physics_process(delta):
	if key != null:
		key.global_position = get_parent().get_position()

# Returns boolean to tell whether a valid key_effect as created
func key_effect() -> bool:
	if key == null:
		if near_key != null:
			pick_up_key()
			return true
	else:
		if lock != null:
			use_key()
			return true
		else:
			drop_key()
			return true
	return false

func pick_up_key():
	key = near_key
	key.deactivate_collision()
	near_key = null

func use_key():
	if lock.valid_input(key):
		lock.receive_input(key)
		key.destroy()
		key = null

func drop_key():
	near_key = key
	near_key.activate_collision()
	key = null



func _on_Area2D_body_entered(body):
	#print_debug("[Key Holder] Body entered")
	#print_debug(body.get_parent().name)
	if body.get_parent().is_in_group("Key"):
		#print_debug("IN Key")
		near_key = body.get_parent()
	elif body.get_parent().is_in_group("Lock"):
		lock = body.get_parent()


func _on_Area2D_body_exited(body):
	if body.get_parent().is_in_group("Key"):
		near_key = null
	elif body.get_parent().is_in_group("Lock"):
		lock = null
