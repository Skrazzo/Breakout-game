extends Node2D

var wall_size = [4, 4]
var cell_size = [96, 32]
var padding = 8

var rows = 3
var colls = 10
var gap = (1100 - (padding * 2) - (wall_size[0] * 2) - (colls * cell_size[0])) / (colls - 1)

var start_pos = [padding + wall_size[0], padding + wall_size[1]]

var blue_brick = preload("res://Bricks/Blue.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(rows):
		for i in range(colls):
			var brick = blue_brick.instantiate()
			add_child(brick)
			
			brick.position.x = start_pos[0] + (cell_size[0] * i) + (gap * i)
			brick.position.y = start_pos[1] + (cell_size[1] * j) + (gap * j)
	
	pass # Replace with function body.

