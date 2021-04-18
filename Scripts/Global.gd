extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"
var current_song = 1

func punt(score):
	if Global.current_song == 1:
		Dialogic.set_variable("PuntosQuetz", score)
	elif Global.current_song == 1:
		Dialogic.set_variable("PuntosMami", score)
	elif Global.current_song == 1:
		Dialogic.set_variable("PuntosCadejos", score)
	elif Global.current_song == 1:
		Dialogic.set_variable("PuntosGui", score)

func set_puntuacion_personaje(score):
	if score > 115000:
		punt(10)
	elif score > 55000:
		punt(5)

func set_score(new):
	score = new
	set_puntuacion_personaje(score)
	if score > 250000:
		grade = "A+"
	elif score > 200000:
		grade = "A"
	elif score > 150000:
		grade = "A-"
	elif score > 130000:
		grade = "B+"
	elif score > 115000:
		grade = "B"
	elif score > 100000:
		grade = "B-"
	elif score > 85000:
		grade = "C+"
	elif score > 70000:
		grade = "C"
	elif score > 55000:
		grade = "C-"
	elif score > 40000:
		grade = "D+"
	elif score > 30000:
		grade = "D"
	elif score > 20000:
		grade = "D-"
	else:
		grade = "F"
	
