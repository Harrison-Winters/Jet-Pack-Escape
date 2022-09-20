extends Node2D

var velocity = Vector2.ZERO


func _ready():
	pass
	
func _process(delta):
#	var velocity = Vector2.DOWN * 200
	position += velocity * delta
	
	if position.y > 800:
		position.y = -500
	
func update_velocity():
	velocity = Vector2.DOWN * 200
	
