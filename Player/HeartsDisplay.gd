extends Node2D

var heart = preload("res://Components/Heart.tscn")
var heart_width = heart.instantiate().get_node("Heart").texture.get_width() * heart.instantiate().get_node("Heart").scale.x
var hearts_arr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	draw_hearts()
	pass # Replace with function body.

func draw_hearts():
	# Delete all hearts
	for x in hearts_arr:
		x.queue_free()
	
	hearts_arr = [] # Remake empty heart array
	
	# Make new array of hearts, and draw them
	for x in range(Global.player_hearts):
		var tmp_heart = heart.instantiate()
		hearts_arr.append(tmp_heart)
		
		add_child(tmp_heart)
		tmp_heart.position.x = 16 + ((heart_width + 4) * x)
		tmp_heart.position.y = 16

func remove_heart():
	Global.player_hearts -= 1
	draw_hearts()
	pass

func add_heart():
	Global.player_hearts += 1
	draw_hearts()
	pass


func _on_ball_player_damage():
	if Global.player_hearts > 0:
		remove_heart()
	else:
		Global.player_hearts = 0
	pass # Replace with function body.


func _on_ball_player_heal():
	add_heart()
	pass # Replace with function body.
