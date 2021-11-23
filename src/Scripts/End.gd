extends Control

func _ready():
	$VBoxContainer/Grade/GradeNumber.text = Global.grade
	$VBoxContainer/Score/ScoreNumber.text = str(Global.score)
	$VBoxContainer/Combo/ComboNumber.text = str(Global.combo)
	$VBoxContainer/Great/GreatNumber.text = str(Global.great)
	$VBoxContainer/Good/GoodNumber.text = str(Global.good)
	$VBoxContainer/Okay/OkayNumber.text = str(Global.okay)
	$VBoxContainer/Missed/MissedNumber.text = str(Global.missed)

func _on_PlayAgain_pressed():
	if Global.current_song == 1:
		if get_tree().change_scene("res://Niveles/DesBaile1.tscn") != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 2:
		if get_tree().change_scene("res://Niveles/DesBaile2.tscn") != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 3:
		if get_tree().change_scene("res://Niveles/DesBaile3.tscn") != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 4:
		if get_tree().change_scene("res://Niveles/Final.tscn") != OK:
			print ("Error changing scene to Game")

func _on_BackToMenu_pressed():
	if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
		print ("Error changing scene to Menu")

func _on_Seguir_pressed():
	if Global.current_song == 1:
		if get_tree().change_scene("res://Niveles/DesBaile1.tscn") != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 2:
		if get_tree().change_scene("res://Niveles/DesBaile2.tscn") != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 3:
		if get_tree().change_scene("res://Niveles/DesBaile3.tscn") != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 4:
		if get_tree().change_scene("res://Niveles/Final.tscn") != OK:
			print ("Error changing scene to Game")

func _on_Regresar_pressed():
	if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
		print ("Error changing scene to Menu")
