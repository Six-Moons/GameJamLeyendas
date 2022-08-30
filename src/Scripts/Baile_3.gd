extends Baile

func _on_Conductor_measure(position):
	spawn_notes_on_position(position)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats >= 240 + offset:
		end_song(score, 244)
	elif song_position_in_beats > 236 + offset:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	elif song_position_in_beats > 184 + offset:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 1
	elif song_position_in_beats > 132 + offset:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	elif song_position_in_beats > 98 + offset:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	elif song_position_in_beats > 36 + offset:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	else:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
