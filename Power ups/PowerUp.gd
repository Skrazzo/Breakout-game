extends CharacterBody2D



# Power up class, and then meta
var power_ups = [
	["res://Power ups/Assets/health.png", 'health'],
	["res://Power ups/Assets/bullet.png", 'bullet'],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(0, 4)
	
	var rnd = power_ups.pick_random()
	
	$Sprite2D.texture = load(rnd[0])
	set_meta('powerup', rnd[1])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(velocity)
	pass
