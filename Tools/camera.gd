class_name Camera
extends Camera3D

@export var default_distance : float = 3.2

var camera_up : bool = false
var camera_down : bool = false
var camera_left : bool = false
var camera_right : bool = false
var zoomIn : bool = false
var zoomOut : bool = false

func _ready() -> void:
	global_position.z = default_distance
	reset()


func _process(delta: float) -> void:
	if Input.is_action_pressed("camera_right") or camera_right:
		move_camera("x", -1, 2)
	if Input.is_action_pressed("camera_left") or camera_left:
		move_camera("x", 1, -2)
	if Input.is_action_pressed("camera_up") or camera_up:
		move_camera("y", -1, 2)
	if Input.is_action_pressed("camera_down") or camera_down:
		move_camera("y", 1, -2)
	if Input.is_action_pressed("camera_zoom_in") or zoomIn:
		move_camera("z", 1, 2)
	if Input.is_action_pressed("camera_zoom_out") or zoomOut:
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
	

# Camera buttons
func _on_move_up_button_down() -> void:
	camera_up = true

func _on_move_up_button_up() -> void:
	camera_up = false

func _on_move_down_button_down() -> void:
	camera_down = true

func _on_move_down_button_up() -> void:
	camera_down = false

func _on_move_left_button_down() -> void:
	camera_left = true

func _on_move_left_button_up() -> void:
	camera_left = false

func _on_move_right_button_down() -> void:
	camera_right = true

func _on_move_right_button_up() -> void:
	camera_right = false

func _on_zoom_in_button_down() -> void:
	zoomIn = true

func _on_zoom_in_button_up() -> void:
	zoomIn = false

func _on_zoom_out_button_down() -> void:
	zoomOut = true

func _on_zoom_out_button_up() -> void:
	zoomOut = false
