extends MeshInstance3D

@export var velocity: Vector3 = Vector3(4, 8, 0)
const GRAVITY = 9.8
var time = 0.0

func _process(delta):	
	time += delta
	velocity.y -= GRAVITY * delta
	position += velocity * delta
	if position.y <= 0:	
		print(time)
		set_process(false)
