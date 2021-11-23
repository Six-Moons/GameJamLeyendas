extends Control

func _on_Button_pressed():
	if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
		print ("Error changing scene to Menu")
	pass # Replace with function body.
