extends Node

@export var fade_duration = 1.0
@export var enemy_speed = 3.0 


func greet():
	print("hi")
	
func add(a, b):
	print (a + b)
	
func _on_body_entered(body):
	print("something walked in")
	

	
func _ready():	
	_check_health(30)
	
func _check_health(health):	
	if health < 0:	
		print("dead")
	elif health < 20:	
		print("hurt")
	else:	
		print("fine")
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	

		
	
	
	
