extends RigidBody2D
class_name Enemy


var life = 2
var velocity = Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.emit_signal("on_enemy_life_changed", life)
	$AnimatedSprite.play("default")
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	pass
	
func damage(amount: int):
	$DamageSound.play()
	life -= amount
	Signals.emit_signal("on_enemy_life_changed", life)
	#print("Enemy Life = %s" % life)
	
	#Flashing animation
	$AnimatedSprite.play("got_hit")
	
	if life <= 0:
		#print("Enemy died")
		queue_free()

#shoot single bullet in whatever direction the enemy is facing
func _on_ShotTimer_timeout():
	var resource = load("res://enemy_bullet.tscn")
	var bullet = resource.instance()
	owner.add_child(bullet)
	bullet.global_transform = $EnemyShootPosition.global_transform
	
func update_velocity():
	velocity = Vector2.DOWN * 200
	
	
	


func _on_enemy_body_entered(body):
	pass # Replace with function body.


func _on_enemy_body_bullet_entered(body):
	pass # Replace with function body.


func _on_DamageSound_finished():
	$DamageSound.stop()
