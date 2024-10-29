extends Node3D

var itens_visible : bool = true


# Change UI visibility
func _on_visibility_pressed() -> void:
	if itens_visible:
		hideItens()
	if !itens_visible:
		showItens()
	itens_visible = !itens_visible
	
func hideItens() -> void:
	$ModelRotation.hide()
	$CameraMovement.hide()
	for child in $SceneControl/VBoxContainer.get_children():
		child.hide()
	$SceneControl/VBoxContainer/Visibility.show()
	
	
func showItens() -> void:
	$ModelRotation.show()
	$CameraMovement.show()
	for child in $SceneControl/VBoxContainer.get_children():
		child.show()
	$SceneControl/VBoxContainer/Visibility.show()
	

# Change model
func showModel(model : Node3D):
	for child in $Models.get_children():
		child.hide()
	model.show()

func _on_texture_button_pressed() -> void:
	showModel($Models/baseModel)

func _on_texture_button_2_pressed() -> void:
	showModel($Models/basePyramid)

func _on_texture_button_3_pressed() -> void:
	showModel($Models/baseCylinder)
