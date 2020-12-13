extends ParallaxBackground


func _process(delta):
	$ParallaxLayer.motion_offset.x += 0.4
