extends "res://enemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ShotTimer_timeout():
	var resource = load("res://enemy_bullet.tscn")
	var shot_angle = PI
	var num_shots = 16
	for i in num_shots:
		var bullet = resource.instance()
		owner.add_child(bullet)
		bullet.global_transform = $EnemyShootPosition.global_transform
		bullet.angle = shot_angle
		shot_angle += 2*PI/num_shots

