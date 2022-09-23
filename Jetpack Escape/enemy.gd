extends RigidBody2D


var health = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#shoot single bullet in whatever direction the enemy is facing
func _on_ShotTimer_timeout():
	var resource = load("res://enemy_bullet.tscn")
	var bullet = resource.instance()
	owner.add_child(bullet)
	bullet.transform = $EnemyShootPosition.global_transform
