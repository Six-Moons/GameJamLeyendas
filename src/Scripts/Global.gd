extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"
var current_song = 1

func punt(char_score):
	if Global.current_song == 1:
		Dialogic.set_variable("PuntosQuetz", char_score)
	elif Global.current_song == 2:
		Dialogic.set_variable("PuntosMami", char_score)
	elif Global.current_song == 3:
		Dialogic.set_variable("PuntosCadejos", char_score)
	elif Global.current_song == 4:
		Dialogic.set_variable("PuntosGui", char_score)

# func set_puntuacion_personaje(char_score):
# 	if char_score > 115000:
# 		punt(10)
# 	elif char_score > 55000:
# 		punt(5)

func set_score(new, num_arrows):
	score = new
	# set_puntuacion_personaje(score)
	if score > num_arrows * 45:
		grade = "Excelente"
		punt(10)
	elif score > num_arrows * 20:
		grade = "Estuvo bien"
		punt(5)
	else:
		grade = "Este..."
		punt(0)
	
