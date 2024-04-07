extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var speed = 500

# Generate random start direction for the ball
var direction = Vector2(rng.randf_range(-1, 1), -1)
var isActive = false
var gameOver = true

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = get_viewport_rect().size.x / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('fire') and gameOver:
		isActive = true
		gameOver = false
	
	# if isActive isn't false, then ball does not move, so that means that ball calculations do not happen
	if !isActive:
		return
	
	velocity = speed * direction * delta
	var collision = move_and_collide(velocity)
	
	if collision != null:
		# Detects collision with the player
		if collision.get_collider_id() == Global.player_id:
			var bounce_direction_x = get_bounce_x_direction(collision)
			# Get normal bounce, and change it to the new calculatedd bounce x direction
			direction = direction.bounce(collision.get_normal()) 
			direction.x = bounce_direction_x
			
		else: # Collides with anything else than a player
			if collision.get_collider().get_meta('brick'):
				collision.get_collider().hit()
			direction = direction.bounce(collision.get_normal())
		
	pass

func get_bounce_x_direction(collision: KinematicCollision2D):
	# Calculate relative position of the ball with the player
	# Player 0 being in the middle negative being on the left and positive being on the right
	var rel = collision.get_position().x - Global.player.global_position.x
	# Now we need to get -1 to 1 value for direction
	# So we take relative position and divide with players half width (To make 0 in the center)
	return rel / (Global.player_width / 2)
	
	
	
	
# Ball is not visible on the screen, so we need to restart our main scene
func _on_visible_on_screen_notifier_2d_screen_exited():
	gameOver = true
	get_tree().change_scene_to_file("res://node_2d.tscn")
	pass # Replace with function body.
