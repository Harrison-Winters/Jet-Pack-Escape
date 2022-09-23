extends Area2D


# Declare member variables here. Examples:
var angular_speed = PI
var speed = 750.0
var angle = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2.UP.rotated(angle) * speed
	position += velocity * delta
	
#TODO destroy bullet on collision with enemy/obstacle
func _on_PlayerBullet_body_entered(body):
	queue_free()

#destroys bullet once it exits the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
