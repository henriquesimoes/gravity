extends "res://Scripts/minigame.gd"

const BLOCK_SIZE = 40
const PADDING = 0

var column = int(OS.window_size.x/BLOCK_SIZE) + 1
var line = int(OS.window_size.y/BLOCK_SIZE) + 1

func _ready():
	"""#functions in main.gd
	var path = generatePath(column, line)
	var wall = create_wall(path)
	"""
	#fuctions in class: Tilebox.gd
	var tilebox = load("res://Minigames/Gravity/Scripts/Tilebox.gd")
	var tile = tilebox.new()#instance of class tilebox.gd
	self.add_child( tile )#adding to scene
	var path_from_class = tile.generatePath(column, line)#creating path using classes function
	var n1 = tile.create_wall(path_from_class)#creating wall using classes bluewall object
	tile.add_wall_y(n1, 200)
	
	
	
	pass

func minigame_start():
	.minigame_start()
	
	pass
func _process(delta):
	
	pass
	

	
	
func create_wall(path, x = 0, y = 0):
	var wall = []
	var tile_file = load('res://Minigames/Gravity/Scenes/Tile.tscn')

	
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
	
	
	