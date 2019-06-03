extends "res://Scripts/minigame.gd"


var column

var row

func _ready():
	set_process(false)
	column = int($TileMap.get_used_rect().size.x/$TileMap.scale.x)
	row = int($TileMap.get_used_rect().size.y/$TileMap.scale.y)
	$Player.difficulty = difficulty
	
	$Player.screen_width = get_tree().get_root().size.x
	var path = gen_path(column)
	apply_path(path)
	
	pass

func minigame_start():
	.minigame_start()
	pass
	
func _process(delta):
	
	fall(delta)
	pass

func apply_path(path_trace):
	var height = $TileMap.get_used_rect().size.y
	var width = $TileMap.get_used_rect().size.x
	var i = 0
	for cols in path_trace:
		for j in cols:
			$TileMap.set_cell(j, i, -1)
		i += 1
	pass
	
func gen_path (length, depth = 100, base = randi()):
	base %= length - int(length/2)
	base += int(length/4)
	var result = []
	for i in range(depth):
		var value = []
		var random
		if base == 0:
			random = randi()%2
		elif base == length-1:
			random = randi()%2-1
		else:
			random = randi() % 3 - 1
		value.append(base)
		if random != 0:
			value.append(base + random)
		base += random
		result.append(value)
	return result
	
func fall(delta):
	var multiplier = difficulty * 100 * Engine.get_time_scale()
	$TileMap.position.y -= multiplier * delta
	$Background.position.y -= multiplier * delta * 0.05
	pass

func _on_Player_body_entered(body):
	lose()
	set_process(false)
	$Player.set_process(false)
	pass 
