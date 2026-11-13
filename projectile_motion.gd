extends Node3D

@export var A: MeshInstance3D
@export var B: MeshInstance3D
var speed_a = 10.0
var speed_b = 9.0
var elapsed_time = 0.0
var has_met = false

func _ready():	
	print("time: ", elapsed_time)

func _process(delta):	
	if has_met:	
		return
	elapsed_time += delta
	A.position.x += speed_a * delta
	B.position.z += speed_b * delta
	if A.global_position.x >= B.global_position.x:	
		has_met = true
		print(elapsed_time)
		print(A.global_position.x)
	
