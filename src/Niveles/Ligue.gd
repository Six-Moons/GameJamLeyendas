extends Control

func _ready():
	var quetz = Dialogic.get_variable("PuntosQuetz")
	var codejos = Dialogic.get_variable("PuntosCodejos")
	var mami = Dialogic.get_variable("PuntosMami")
	var gui = Dialogic.get_variable("PuntosGui")

	var score_high = '10'
	var score_meh = '5'
	
	if quetz == score_high:
		Dialogic.set_variable("Ligue", "Quetz")
	elif codejos == score_high:
		Dialogic.set_variable("Ligue", "Cadejos")
	elif mami == score_high:
		Dialogic.set_variable("Ligue", "Mami")
	elif gui == score_high:
		Dialogic.set_variable("Ligue", "Gui")
	elif quetz == score_meh:
		Dialogic.set_variable("Ligue", "Quetz")
	elif codejos == score_meh:
		Dialogic.set_variable("Ligue", "Cadejos")
	elif mami == score_meh:
		Dialogic.set_variable("Ligue", "Mami")
	elif gui == score_meh:
		Dialogic.set_variable("Ligue", "Gui")
	
	var dialogo = Dialogic.start("ligue")
	add_child(dialogo)
