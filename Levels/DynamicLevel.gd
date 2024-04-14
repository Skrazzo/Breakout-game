extends Node2D

var wall_size = [4, 4]
var cell_size = [96, 32]
var padding = 18

var rows = 2
var colls = 11



var start_pos = [padding + wall_size[0], padding + wall_size[1]]

# Bricks
var blue_brick = preload("res://Bricks/Blue.tscn")
var green_brick = preload("res://Bricks/Green.tscn")
var purple_brick = preload("res://Bricks/Purple.tscn")
var invincible_brick = preload("res://Bricks/Invincible.tscn")

# from 1 to 5
@export_range(1,5) var difficulty = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.brick_count = 0	
	rows += difficulty
	
	# Calculating probabilities
	var green_prob = 0.1 + (0.05 * difficulty)
	var no_brick_prob = green_prob + 0.6 - (0.1 * difficulty)
	var purple_prob = no_brick_prob + 0.02
	var invincible_prob = purple_prob + 0 + (0.03 * difficulty)
	
	for j in range(rows):
		for i in range(colls):
			var rand = randf()
			
			if rand < green_prob: # green brick
				init_brick(green_brick.instantiate(), j, i)
				Global.brick_count += 1
			elif rand < no_brick_prob: # empty space
				continue
			elif rand < purple_prob:
				init_brick(purple_brick.instantiate(), j, i)
				Global.brick_count += 1
			elif rand < invincible_prob: # invincible brick
				init_brick(invincible_brick.instantiate(), j, i)
			else: # normal brick
				init_brick(blue_brick.instantiate(), j, i)
				Global.brick_count += 1
	pass # Replace with function body.

func init_brick(brick, row, col):
	add_child(brick)
	brick.position.x = start_pos[0] + (cell_size[0] * col)
	brick.position.y = start_pos[1] + (cell_size[1] * row)



func _on_ball_level_done():
	_ready()
	pass # Replace with function body.
