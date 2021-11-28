extends AnimatedSprite

var perfect = false
var good = false
var okay = false
var current_note = null

export var input = ""

func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				var pos
				if perfect:
					pos = 3
				elif good:
					pos = 2
				elif okay:
					pos = 1
				get_parent().increment_score(pos)
				current_note.destroy(pos)
				_reset()
			else:
				get_parent().increment_score(0)
		if event.is_action_pressed(input):
			frame = 1
		elif event.is_action_released(input):
			$PushTimer.start()

func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note"):
		perfect = true

func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note"):
		perfect = false

func _on_GoodArea_area_entered(area):
	if area.is_in_group("note"):
		good = true

func _on_GoodArea_area_exited(area):
	if area.is_in_group("note"):
		good = false

func _on_OkayArea_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area

func _on_OkayArea_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		current_note = null

func _on_PushTimer_timeout():
	frame = 0

func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false
