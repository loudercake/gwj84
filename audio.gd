extends AudioStreamPlayer

var delay = 3.0

var adaptive_track = 0

func _process(delta: float) -> void:
	match adaptive_track:
		0:
			pass
		_:
			pass
	if !playing:
		play()



	
