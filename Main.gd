extends "res://Scripts/minigame.gd"

const BLOCK_SIZE = 40
const PADDING = 0

var blocks = [];

	
func _ready():
	var WallBlock = load('res://Minigames/Gravity/objects/WallBlock.tscn')
	

	var blocksLine = int(OS.window_size.y / BLOCK_SIZE) + 1
	var blocksColumns = int(OS.window_size.x / BLOCK_SIZE) + 1
	var path = generatePath(blocksColumns, blocksLine)
	
	for i in range(blocksLine):
		blocks.append([])
		for j in range(blocksColumns):
			if path[i].find(j) > -1:
				continue
			var blockInstance = WallBlock.instance()
			blockInstance.position.x =  (BLOCK_SIZE + PADDING) * j + BLOCK_SIZE/2;
			blockInstance.position.y =  (BLOCK_SIZE + PADDING) * i + BLOCK_SIZE/2;
			self.add_child(blockInstance)
			blocks[i].append(blockInstance)
	pass

func minigame_start():
	.minigame_start()
	
	pass
	
func _process(delta):
	pass
	
func generatePath (length, depth = 100, base = randi()):
	base %= length
	var result = []
	for i in range(depth):
		var value = []
		var random = randi() % 3 - 1
		value.append(base)
		value.append(base + random)
		base += random
		result.append(value)
	return result