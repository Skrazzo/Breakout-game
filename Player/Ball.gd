extends CharacterBody2D
var rng = RandomNumberGenerator.new()

var speed = 500

# Generate random start direction for the ball
var direction = Vector2(rng.randf_range(-1, 1), rng.randf_range(-0.5, -1))
var isActive = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('fire'):
		isActive = true
	
	# if isActive isn't false, then ball does not move, so that means that ball calculations do not happen
	if !isActive:
		return
	
	velocity = speed * direction * delta
	var collision = move_and_collide(velocity)
	
	if collision != null:
		direction = direction.bounce(collision.get_normal())
	
	pass
