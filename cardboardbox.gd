extends Node3D



@export var box_id = ""
var player_in_range = false

func _on_body_entered(body):	
	if body.name == "Myra":	
		player_in_range = true
		body.nearby_box = self
		print("near box:", get_parent().name)
		
func _on_body_exited(body):	
	if body.name == "Myra":	
		player_in_range = false
		if body.nearby_box == self:	
			body.nearby_box = null
		
		
		
func pick_up(hold_point):	
	get_parent().add_child(self)
	hold_point.remove_child(self)
	position = Vector3.ZERO
	rotation = Vector3.ZERO
		
		
func put_down(world_root,drop_position):	
	get_parent().remove_child(self)
	world_root.add_child(self)
	var target = find_nearest_target(drop_position)
	if target and target.filled:	
		global_position = target.global_position
		target.filled(true)
		target.on_filled()
	else:	
		var space = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(
			drop_position,drop_position + Vector3(0, -3, 0))
		var hit = space.intersect_ray(query)
		if hit:	
			global_position = hit.position
		else:	
			global_position = drop_position
			rotation = Vector3.ZERO


func find_nearest_target(pos):
	var best = null
	var best_dist = 1.5
	for t in get_tree().get_nodes_in_group("box_targets"):
		var d = pos.distance_to(t.global_position)
		if d < best_dist:
			best_dist = d
			best = t
	return best
