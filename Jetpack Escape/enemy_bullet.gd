extends Area2D


# Declare member variables here. Examples:
var angular_speed = PI
var speed = 400.0
var angle = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#TODO: set angle to be the rotation angle of parent (player or enemy)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.DOWN.rotated(angle) * speed
	position += velocity * delta
	
#destroys bullet once it exits the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_EnemyBullet_body_entered(body):
	if body is Player:
		body.damage(1)
