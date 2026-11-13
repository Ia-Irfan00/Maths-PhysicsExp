extends Area3D

@export var prop: Node3D
@export var normal_marker: Marker3D
@export var altered_marker: Marker3D
@export var notifier: VisibleOnScreenNotifier3D
@export var vanish_instead: bool = false

var _armed: bool = false
var _fired: bool = false

func _ready()->void:	
	if prop and normal_marker:	
		prop.global_transform = normal_marker.global_transform
		set_process(true)
		
		
func _arm()->void:	
	if _fired:	
		return
	_armed = true
	set_process(true)
		
		
		
func _process(_delta: float)->void:	
	if not _armed and _fired:	
		return
	if notifier and notifier.is_on_screen():	
		return
		
	_apply()
		
	
	
	
	
func _apply()->void:	
	_armed = true
	_fired = true
	set_process(false)
	
	if vanish_instead:	
		prop.visibile = false
		if prop is CollisionObject3D:	
			prop.process_mode = Node.PROCESS_MODE_DISABLED
		elif altered_marker:	
			prop.global_transform = altered_marker.global_transform
			
			
		_fired.emit()
			
			
		
		
func _reset()->void:	
	_fired = false
	_armed = false
	if prop and normal_marker:	
		prop.global_transform = normal_marker.global_transform
		
		

		
		
			
	
			
		
	
	
	
	
	
	
