extends Node3D

var mesh_path : MeshInstance3D

func _ready() -> void:
	mesh_path = get_child(0)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		rotation_degrees.y += 2
	if Input.is_action_pressed("ui_down"):
		rotation_degrees.y -= 2
	if Input.is_action_pressed("ui_left"):
		rotation_degrees.z -= 2
	if Input.is_action_pressed("ui_right"):
		rotation_degrees.z += 2
