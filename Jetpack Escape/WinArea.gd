extends Area2D

signal win

var velocity = Vector2.ZERO


func _ready():
	pass
	
func _process(delta):

	position += velocity * delta
	

	
func update_velocity():
	velocity = Vector2.DOWN * 200
	


func _on_WinArea_body_entered(body):
	if body.name == "PlayerCollisionObject":
		emit_signal("win")
		
