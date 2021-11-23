extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var quetz = Dialogic.get_variable("PuntosQuetz")
	var codejos = Dialogic.get_variable("PuntosCodejos")
	var mami = Dialogic.get_variable("PuntosMami")
	var gui = Dialogic.get_variable("PuntosGui")
	
	if quetz == '10':
		Dialogic.set_variable("Ligue", "Quetz")
	elif codejos == '10':
		Dialogic.set_variable("Ligue", "Cadejos")
	elif mami == '10':
		Dialogic.set_variable("Ligue", "Mami")
	elif gui == '10':
		Dialogic.set_variable("Ligue", "Gui")
	elif quetz == '5':
		Dialogic.set_variable("Ligue", "Quetz")
	elif codejos == '5':
		Dialogic.set_variable("Ligue", "Cadejos")
	elif mami == '5':
		Dialogic.set_variable("Ligue", "Mami")
	elif gui == '5':
		Dialogic.set_variable("Ligue", "Gui")
	
	var dialogo = Dialogic.start("ligue")
	add_child(dialogo)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
