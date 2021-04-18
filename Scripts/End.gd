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
	if get_tree().change_scene("res://Scenes/Game.tscn") != OK:
			print ("Error changing scene to Game")


func _on_BackToMenu_pressed():
	if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")
