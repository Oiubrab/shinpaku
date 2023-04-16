extends Camera3D

var time: float = 0.0

func _process(delta):
	time += delta
	position.z = 5 * sin(PI/3 * time) + 2

