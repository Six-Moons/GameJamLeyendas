extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"
var current_song = 0

func change_scene(path) -> void:
	if get_tree().change_scene(path) != OK:
		print ("Error changing scene to End")
	pass

func punt(char_score):
	if Global.current_song == 1:
		Dialogic.set_variable("PuntosQuetz", char_score)
	elif Global.current_song == 2:
		Dialogic.set_variable("PuntosMami", char_score)
	elif Global.current_song == 3:
		Dialogic.set_variable("PuntosCadejos", char_score)
	elif Global.current_song == 4:
		Dialogic.set_variable("PuntosGui", char_score)
	print_char_variables()

func print_char_variables():
	print("----")
	print("PuntosQuetz ", Dialogic.get_variable("PuntosQuetz"))
	print("PuntosMami ", Dialogic.get_variable("PuntosMami"))
	print("PuntosCadejos ", Dialogic.get_variable("PuntosCadejos"))
	print("PuntosGui ", Dialogic.get_variable("PuntosGui"))
	print("----")

func set_score(new, num_arrows):
	score = new
	
	if score > num_arrows * 45:
		grade = "Excelente"
		punt(10)
	elif score > num_arrows * 20:
		grade = "Estuvo bien"
		punt(5)
	else:
		grade = "Este..."
		punt(0)
	
