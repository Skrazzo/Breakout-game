extends Node2D

signal HealthChanged(hp: int)

@export var MAX_HEALTH: int = 1
var hp: int

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = MAX_HEALTH
	pass # Replace with function body.

func damage(damage: int = 1):
	hp -= damage
	emit_signal("HealthChanged", hp)
	return hp

