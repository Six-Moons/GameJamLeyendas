extends Control

export(String, FILE) var next_scene_path: = ""

func _on_Start_Button_button_down():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 
								linear2db($HSlider.value))
	if get_tree().change_scene(next_scene_path) != OK:
		print ("Error changing scene to Game")


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),
								linear2db(value))


func _on_TextureButton_pressed():
	$Button/AudioStreamPlayer.play()


func _on_Button_pressed():
	$Button/AudioStreamPlayer.play()
