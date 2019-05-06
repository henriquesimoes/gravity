extends Area2D

var position_vector = Vector2(320,130)
var max_speed = 350
var speed = 0
var time = 0
var difficulty = 1
var screen_width = 0

func _ready():
	max_speed *= Engine.get_time_scale() * sqrt(difficulty)
	pass

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		increase_speed()
		if position_vector.x + speed*delta <= screen_width:
			position_vector.x += speed*delta
		$Sprite.flip_v = false
	elif Input.is_action_pressed("ui_left"):
		increase_speed()
		if position_vector.x - speed*delta >= 0:
			position_vector.x -= speed*delta
		$Sprite.flip_v = true
	
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		speed = 0
	
	position = position_vector
	pass

func increase_speed():
	if speed < max_speed:
		speed += 10 * difficulty
