extends CharacterBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play('default')
	velocity = Vector2(0, -7)	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var collision = move_and_collide(velocity)
	if collision:
		var collider = collision.get_collider()
		if collider.has_meta('brick') and collider.get_meta('brick') == true: # hit a brick
			var angle = rad_to_deg(collision.get_angle()) - 90 # Calculate angle
			collider.hit(collision.get_position(), collision.get_collider().position, angle)
		
			$CollisionShape2D.disabled = true
			$AnimatedSprite2D.visible = false
			$CPUParticles2D.emitting = true
		
	pass


func _on_cpu_particles_2d_finished():
	queue_free()
	pass # Replace with function body.
