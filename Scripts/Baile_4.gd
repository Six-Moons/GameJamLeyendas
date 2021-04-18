extends Control

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = 196

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var offset = 8

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/Note.tscn")
var r = 1
var g = 0
var b = 0
var letra = "r"

func _ready():
	randomize()
	$Conductor.play_with_beat_offset(offset)


func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")


func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats > 36 + offset:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 98 + offset:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 132 + offset:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 162 + offset:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 194 + offset:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 252 + offset:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 256 + offset:
		Global.set_score(score)
		Global.combo = max_combo
		Global.great = great
		Global.good = good
		Global.okay = okay
		Global.missed = missed
		Global.current_song = 4
		if get_tree().change_scene("res://Scenes/End.tscn") != OK:
			print ("Error changing scene to End")



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
	
	actualizar_colores(delta)
