extends Node2D

# bullets available, when we shoot, we shoot one bullet and count it down
var bullets = 0

var bullet_class = preload("res://Components/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	if bullets > 0:
		bullets -= 1
		var bullet_position = get_node("../Player").position
		var child = bullet_class.instantiate()
		
		var root_node = get_parent()
		child.position = bullet_position
		root_node.add_child(child)
		
		
	pass # Replace with function body.


func _on_player_bullet_power_up():
	bullets += 10
	pass # Replace with function body.
