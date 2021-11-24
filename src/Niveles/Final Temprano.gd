extends Control

export(String, FILE) var menu_path: = ""

func _on_Button_pressed():
	if get_tree().change_scene(menu_path) != OK:
		print ("Error changing scene to Menu")
	pass # Replace with function body.
