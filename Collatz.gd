extends Node

var num = 27
var step_count = 0



func _ready():	
	while num != 1:	
		if num % 2 == 0:	
			num /= 2
		else:	
			num = num * 3 + 1
		step_count += 1
		print(num)
	print(step_count)
