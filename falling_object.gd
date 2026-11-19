extends Node3D

@export var Ball: MeshInstance3D
var gravity = 9.8
var velocity = 0.0
var elapsed_time = 0.0
var start_y = 100.0
var next_second = 1.0
var done = false

func _ready():	
	start_y = Ball.position.y
	
	
	
func _process(delta):	
	if done:	
		return
	elapsed_time += delta
	velocity += gravity * delta
	Ball.position.y -= velocity * delta
	if elapsed_time >= next_second:	
		var distance = start_y - Ball.position.y
		print("second: ", next_second, "  distance: ", distance)
		next_second += 1
		if next_second > 4:	
			done = true
	
	
	
