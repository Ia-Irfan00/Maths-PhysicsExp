extends ColorRect

var player_in_range = false
var  is_rotate_door = false

func fade_to_black()->void:	
	var tween = create_tween() # tween = animates a value over time
	tween.tween_property(self, "color:a", 1.0, 0.5) # alpha 0→1, over 0.5s = screen goes opaque black
	
func fade_to_clear() -> void:	
	var tween = create_tween()
	tween.tween_property(self, "color:a", 0.0, 0.5)
	
	

func _on_body_entered(body):	
	if body.name == "Myra":	 # better to replace body name "Myra" with "player", ask why
		player_in_range = true
		print("near door: ", get_parent().name)
		
func _on_body_exited(body):	
	if body.name == "Myra":	
		player_in_range = false




		
		
	

		
		
	
	
	
	
	
	
	
	
	
