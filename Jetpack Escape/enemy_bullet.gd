extends "res://bullet.gd"


# Declare member variables here. Examples:
# Called when the node enters the scene tree for the first time.
func _ready():
	#angle = global_rotation
	angle = PI
	speed = 350.0
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2.UP.rotated(angle) * speed
	#var velocity  = global_transform.x * speed
	position += velocity * delta
	
#destroys bullet once it exits the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_EnemyBullet_body_entered(body):
	if body is Player:
		body.damage(1)
