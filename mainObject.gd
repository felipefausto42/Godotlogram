extends Node3D

var mesh_path : MeshInstance3D

var move_up : bool = false
var move_down : bool = false
var move_left : bool = false
var move_right : bool = false


func _ready() -> void:
	mesh_path = get_child(0)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up") or move_up:
		rotation_degrees.y += 2
	if Input.is_action_pressed("ui_down") or move_down:
		rotation_degrees.y -= 2
	if Input.is_action_pressed("ui_left") or move_left:
		rotation_degrees.z -= 2
	if Input.is_action_pressed("ui_right") or move_right:
		rotation_degrees.z += 2



func _on_up_button_down() -> void:
	move_up = true

func _on_up_button_up() -> void:
	move_up = false


func _on_down_button_down() -> void:
	move_down = true

func _on_down_button_up() -> void:
	move_down = false


func _on_left_button_down() -> void:
	move_left = true

func _on_left_button_up() -> void:
	move_left = false


func _on_right_button_down() -> void:
	move_right = true

func _on_right_button_up() -> void:
	move_left = false
