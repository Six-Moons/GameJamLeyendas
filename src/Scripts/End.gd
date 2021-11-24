extends Control

export(String, FILE) var menu_path: = ""
export(String, FILE) var des_baile1: = ""
export(String, FILE) var des_baile2: = ""
export(String, FILE) var des_baile3: = ""
export(String, FILE) var final_path: = ""

func _ready():
	$VBoxContainer/Grade/GradeNumber.text = Global.grade
	$VBoxContainer/Score/ScoreNumber.text = str(Global.score)
	$VBoxContainer/Combo/ComboNumber.text = str(Global.combo)
	$VBoxContainer/Great/GreatNumber.text = str(Global.great)
	$VBoxContainer/Good/GoodNumber.text = str(Global.good)
	$VBoxContainer/Okay/OkayNumber.text = str(Global.okay)
	$VBoxContainer/Missed/MissedNumber.text = str(Global.missed)

func _on_Seguir_pressed():
	if Global.current_song == 1:
		if get_tree().change_scene(des_baile1) != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 2:
		if get_tree().change_scene(des_baile2) != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 3:
		if get_tree().change_scene(des_baile3) != OK:
			print ("Error changing scene to Game")
	elif Global.current_song == 4:
		if get_tree().change_scene(final_path) != OK:
			print ("Error changing scene to Game")

func _on_Regresar_pressed():
	if get_tree().change_scene(menu_path) != OK:
		print ("Error changing scene to Menu")
