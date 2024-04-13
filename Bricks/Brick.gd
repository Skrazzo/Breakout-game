extends CharacterBody2D

var hp = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta('brick', true) # set metadate to brick
	hp = $AnimatedSprite2D.get_sprite_frames().get_frame_count('default') # update hp with frame count
	pass # Replace with function body.


func hit(collision_position, collider_position):
	# Calculate where collision happened on the brick
	var brick_collided_pos = Vector2(collision_position.x - collider_position.x, collision_position.y - collider_position.y)
	$CPUParticles2D.position = brick_collided_pos
	$CPUParticles2D.emitting = true
	
	hp -= 1
	if hp <= 0:
		Global.brick_count -= 1
		queue_free() # Removes child
	else: 
		$AnimatedSprite2D.frame += 1
