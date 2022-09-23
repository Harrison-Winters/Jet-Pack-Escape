extends "res://bullet.gd"


# Declare member variables here. Examples:
# Called when the node enters the scene tree for the first time.
func _ready():
	angle = PI
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.UP.rotated(angle) * speed
	position += velocity * delta
	
#destroys bullet once it exits the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
