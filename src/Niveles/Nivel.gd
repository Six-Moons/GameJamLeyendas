extends Control

export (String) var nombre_dialogo = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogo = Dialogic.start(nombre_dialogo)
	add_child(dialogo)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
