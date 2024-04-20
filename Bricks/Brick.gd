extends CharacterBody2D

var hp = 1

# Power up
var power_up_class = preload("res://Power ups/PowerUp.tscn")
var active_power_ups = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set bricks collision layer
	set_collision_layer_value(1, false)
	set_collision_layer_value(2, true)
	set_meta('brick', true) # set metadate to brick
	hp = $AnimatedSprite2D.get_sprite_frames().get_frame_count('default') # update hp with frame count
	pass # Replace with function body.


func hit(collision_position, collider_position, angle):
	
	hp -= 1
	if hp <= 0:
		Global.brick_count -= 1
		
		$CPUParticles2D_Explosion.emitting = true
		$AnimatedSprite2D.visible = false
		$CollisionShape2D.disabled = true
		spawn_power_up()
	else: 
		# Calculate where collision happened on the brick
		var brick_collided_pos = Vector2(collision_position.x - collider_position.x, collision_position.y - collider_position.y)
		$CPUParticles2D.position = brick_collided_pos
		$CPUParticles2D.rotation = angle
		$CPUParticles2D.emitting = true
		
		$AnimatedSprite2D.frame += 1
	pass

func spawn_power_up():
	var rnd = randf()
	if rnd > 0.09:
		return
	
	var pwr = power_up_class.instantiate()
	pwr.position = position
	var parent = get_parent()
	parent.add_child(pwr)
	pass

func _on_cpu_particles_2d_explosion_finished():
	queue_free() # Removes child
	pass # Replace with function body.
