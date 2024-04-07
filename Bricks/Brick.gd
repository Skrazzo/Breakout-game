extends CharacterBody2D

var hp = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta('brick', true) # set metadate to brick
	hp = $AnimatedSprite2D.get_sprite_frames().get_frame_count('default') # update hp with frame count
	pass # Replace with function body.

func hit():
	hp -= 1
	if hp <= 0:
		queue_free()
	else: 
		$AnimatedSprite2D.frame += 1
