extends "res://Scripts/minigame.gd"

const BLOCK_SIZE = 40
const PADDING = 0

var column = int(OS.window_size.x/BLOCK_SIZE) + 1
var line = int(OS.window_size.y/BLOCK_SIZE) + 1


func create_wall(path, x = 0, y = 0):
	var wall = []
	var tile_file = load('res://Minigames/Gravity/Scenes/BlueTile.tscn')

	
	for i in range(line):
		wall.append([])
		for j in range(column):
			if path[i].find(j) > -1:
				continue
			var tile_node = tile_file.instance()
			tile_node.position.x = (BLOCK_SIZE + PADDING)*j + (BLOCK_SIZE+PADDING)/2 + x
			tile_node.position.y = (BLOCK_SIZE + PADDING)*i + (BLOCK_SIZE+PADDING)/2 + y
			wall[i].append(tile_node)			
			self.add_child(tile_node)	
	return wall

func add_wall_x(wall, number):
	for row in wall:
		for tile in row:
			tile.position.x += number
	pass
	
func add_wall_y(wall, number):
	for row in wall:
		for tile in row:
			tile.position.y += number
	pass

#falta implementar exceções do base (limites laterais)
#Falta implementar append de tres valores seguidos do path	
func generatePath ( length, depth = 100, base = randi()):
	base %= length
	var result = []
	for i in range(depth):
		var value = []
		var random = randi() %3 - 1
		value.append(base)
		value.append(base + random)
		base += random
		result.append(value)
	return result
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
