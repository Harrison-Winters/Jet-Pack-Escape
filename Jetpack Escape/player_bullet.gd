extends "res://bullet.gd"


func _on_player_bullet_body_entered(body):
	if body is Enemy:
		body.damage(1)
	queue_free()
