extends Area3D

@onready var color_rect = get_node("../../CanvasLayer")
@onready var Myra = get_node("/root/Node3D/Myra")
@onready var marker_a = get_node("../MarkerA")
@onready var marker_b = get_node("../MarkerB")
@onready var audio = get_node("../AudioStreamPlayer")

var player_in_range = false
var is_transitioning = false

func _on_body_entered(body):	
	if body.name == "Myra":	
		player_in_range = true
		print("near door:", get_parent().name)
		
func _on_body_exited(body):	
	if body.name == "Myra":	
		player_in_range = false
		
func _proces(delta):	
	if player_in_range and Input.is_action_just_pressed("Interact") and not is_transitioning:	
		is_transitioning = true
		color_rect.fade_to_black()
		audio.play()
		await get_tree().create_timer(2.0).timeout
		var dist_a = Myra.global_position.distance_to(marker_a.global_position)
		var dist_b = Myra.global_position.distance_to(marker_b.global_position)
		var destination = marker_a
		if dist_a < dist_b:	
			destination = marker_b
		Myra.global_position = destination.global_position
		color_rect.fade_to_clear()
		audio.stop()
		await get_tree().create_timer(0.5).timeout
		is_transitioning = false
		
		
	
	
