extends "res://Scripts/minigame.gd"

const BLOCK_SIZE = 40
const WINDOW_HEIGHT = 400
const WINDOW_WIDTH = 640
const PADDING = 0

var column = int(WINDOW_WIDTH/BLOCK_SIZE) + 1
var line = int(WINDOW_HEIGHT/BLOCK_SIZE) + 1

func _ready():
	var tilebox = load("res://Minigames/Gravity/Scripts/Tilebox.gd")
	var tile = tilebox.new()#instance of class tilebox.gd
	self.add_child( tile )#adding to scene
	var path_from_class = tile.generatePath(column, line)#creating path using classes function
	var wall = tile.create_wall(path_from_class)#creating wall using classes bluewall object
	var velocity = 0
	tile.add_wall_y(wall, 200)

	pass

func minigame_start():
	.minigame_start()
	
	pass
func _process(delta):
	
	pass
