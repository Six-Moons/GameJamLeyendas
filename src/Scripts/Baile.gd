extends Control

class_name Baile

export(String, FILE) var menu_path: = ""
export(String, FILE) var end_path: = ""
export(String, FILE) var note_path: = ""
export(int) var offset

export var current_song = 0 

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 0
var spawn_4_beat = 0

var lane = 0
var rand = 0
onready var note = load(note_path)
var r = 1
var g = 0
var b = 0
var letra = "r"

func _ready():
	$Conductor.play_with_beat_offset(offset)
#	$Conductor.play_from_beat(180, offset)

func _input(event):
	if event.is_action("escape"):
		Global.change_scene(menu_path)

func end_song(song_score, num_arrows) -> void:
	Global.current_song = current_song
	Global.set_score(song_score, num_arrows)
	Global.combo = max_combo
	Global.great = great
	Global.good = good
	Global.okay = okay
	Global.missed = missed
	Global.change_scene(end_path)
	pass

func spawn_notes_on_position(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)
	pass

func _spawn_notes(to_spawn):
	var instance
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)

func increment_score(by):
	if by > 0:
		combo += 1
	else:
		combo = 0
	
	if by == 3:
		great += 1
	elif by == 2:
		good += 1
	elif by == 1:
		okay += 1
	else:
		missed += 1
	
	score += by * combo
	$Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " combo!"
		if combo > max_combo:
			max_combo = combo
	else:
		$Combo.text = ""

func reset_combo():
	combo = 0
	$Combo.text = ""

func cambiar_color(delta, primero, segundo, siguiente_letra):
	var lim_sup = 0.8
	var lim_inf = 0.2
	if primero < lim_sup:
		primero += 1 * delta;
		if primero >= lim_sup:
			primero = lim_sup
	else:
		segundo -= 1 * delta;
		if segundo <= lim_inf:
			segundo = lim_inf
			letra = siguiente_letra
	return [primero, segundo]

func actualizar_colores(delta):
	var arr
	if letra == "r":
		arr = cambiar_color(delta, r, g, "g")
		r = arr[0]
		g = arr[1]
	elif letra == "g":
		arr = cambiar_color(delta, g, b, "b")
		g = arr[0]
		b = arr[1]
	elif letra == "b":
		arr = cambiar_color(delta, b, r, "r")
		b = arr[0]
		r = arr[1]
	pass

func _process(delta):
	$Fondo/ColorRect.color = Color(r, g, b, 0.1)
	
	if Input.is_action_pressed("skip"):
		end_song(90, 1)
		pass
	
	actualizar_colores(delta)
