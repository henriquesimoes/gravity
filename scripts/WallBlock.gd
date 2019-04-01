extends Node2D

const BLOCK_SIZE = 40
const PADDING = 0

var blocks = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	var WallBlock = load('res://Minigames/Gravity/objects/WallBlock.tscn')
	
	var path = [[2], [2,3], [3,2], [2,1]]

	var blocksLine = int(OS.window_size.y / BLOCK_SIZE) + 1
	var blocksColumns = int(OS.window_size.x / BLOCK_SIZE) + 1
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
	blocks[1][0].hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
