extends Node2D



func _ready():
	pass # Replace with function body.
	
func _process(delta):
	var velocity = Vector2.DOWN * 200
	position += velocity * delta	
	
	if position.y > 800:
		position.y = -500
	
