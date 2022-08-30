extends Baile

func _on_Conductor_measure(position):
	spawn_notes_on_position(position)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats >= 191:
		end_song(score, 244)
	elif song_position_in_beats > 186:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	elif song_position_in_beats > 185:
		spawn_1_beat = 3
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	elif song_position_in_beats > 169:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 2
		spawn_4_beat = 2
	elif song_position_in_beats > 153:
		spawn_1_beat = 2
		spawn_2_beat = 1
		spawn_3_beat = 2
		spawn_4_beat = 2
	elif song_position_in_beats > 137:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	elif song_position_in_beats > 121:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 2
		spawn_4_beat = 1
	elif song_position_in_beats > 105:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	elif song_position_in_beats > 97:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	elif song_position_in_beats > 93:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 3
		spawn_4_beat = 0
	elif song_position_in_beats > 81:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	elif song_position_in_beats > 65:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	elif song_position_in_beats > 49:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 2
		spawn_4_beat = 2
	elif song_position_in_beats > 33:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 2
		spawn_4_beat = 0
	elif song_position_in_beats > 17:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 2
	elif song_position_in_beats > 9:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	elif song_position_in_beats > 1:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 1
	else:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
