class_name Camera
extends Camera3D

@export var default_distance : float = 3.2

func _ready() -> void:
	global_position.z = default_distance
	reset()


func _process(delta: float) -> void:
	if Input.is_action_pressed("camera_right"):
		move_camera("x", -1, 2)
	if Input.is_action_pressed("camera_left"):
		move_camera("x", 1, -2)
	if Input.is_action_pressed("camera_up"):
		move_camera("y", -1, 2)
	if Input.is_action_pressed("camera_down"):
		move_camera("y", 1, -2)
	if Input.is_action_pressed("camera_zoom_in"):
		move_camera("z", 1, 2)
	if Input.is_action_pressed("camera_zoom_out"):
		move_camera("z", -1, 6)
	
	if Input.is_action_just_pressed("reset_camera"):
		reset()
		
func move_camera(axis : String, direction : int, limit : float) -> void:
	match axis:
		"x":
			if direction == 1:
				if global_position.x > limit:
					global_position.x -= .02 
				return
			elif direction == -1:
				if global_position.x < limit:
					global_position.x += .02
				return
		"y":
			if direction == 1:
				if global_position.y > limit:
					global_position.y -= .02 
				return
			elif direction == -1:
				if global_position.y < limit:
					global_position.y += .02
				return
		"z":
			if direction == 1:
				if global_position.z > limit:
					global_position.z -= .02 
				return
			elif direction == -1:
				if global_position.z < limit:
					global_position.z += .02
				return
				
func reset() -> void:
	global_position = Vector3(0, 0, default_distance)
	
