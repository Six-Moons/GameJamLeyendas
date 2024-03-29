extends Area2D

const TARGET_Y = 656
const SPAWN_Y = -64
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_SPAWN = Vector2(480, SPAWN_Y)
const CENTRE_LANE_SPAWN = Vector2(640, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(800, SPAWN_Y)

var speed = 0
var hit = false

onready var textLabel = $Node2D/Label
onready var collisionShape = $CollisionShape2D

func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 800:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.y -= speed * delta

func initialize(lane):
	if lane == 0:
		$AnimatedSprite.frame = 0
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite.frame = 1
		position = CENTRE_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite.frame = 2
		position = RIGHT_LANE_SPAWN
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET #/ 2.0

func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite.visible = false
	$Timer.start()
	hit = true
	collisionShape.set_deferred("disabled", true)
	if score == 3:
		textLabel.text = "GREAT"
		textLabel.modulate = Color("f6d6bd")
	elif score == 2:
		textLabel.text = "GOOD"
		textLabel.modulate = Color("c3a38a")
	elif score == 1:
		textLabel.text = "OKAY"
		textLabel.modulate = Color("997577")

func _on_Timer_timeout():
	queue_free()
