extends "res://Scripts/minigame.gd"


onready var column = int($TileMap.get_used_rect().size.x/$TileMap.scale.x)

onready var row = int($TileMap.get_used_rect().size.y/$TileMap.scale.y)

func _ready():
	$Player.difficulty = difficulty
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
	for i in range(height):
		for j in range(width):
			if path_trace[i].find(j) > -1:
				$TileMap.set_cell(j, i, -1)
	pass
	
func gen_path (length, depth = 100, base = randi()):
	base %= length - int(length/2)
	base += int(length/4)
	var result = []
	for i in range(depth):
		var value = []
		var random = randi() % 3 - 1
		while (base + random < 0 or base + random > length - 1):
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
	pass

func _on_Player_body_entered(body):
	lose()
	set_process(false)
	$Player.set_process(false)
	pass 
