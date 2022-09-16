extends KinematicBody2D
var can_shoot = true

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		var velocity = Vector2.LEFT * 400
		move_and_collide(velocity * delta)
#		position += velocity * delta
	if Input.is_action_pressed("ui_right"):
		var velocity = Vector2.RIGHT * 400
		move_and_collide(velocity * delta)
#		
	if Input.is_action_pressed("ui_up"):
		var velocity = Vector2.UP * 400
		move_and_collide(velocity * delta)
#		
	if Input.is_action_pressed("ui_down"):
		var velocity = Vector2.DOWN * 400
		move_and_collide(velocity * delta)
		
	if (not Input.is_action_pressed("ui_left") 
		and not Input.is_action_pressed("ui_right")
		and not Input.is_action_pressed("ui_up")
		and not Input.is_action_pressed("ui_down")):
			move_and_collide(Vector2.ZERO)
#
var screen_size = Vector2.ZERO

func _process(delta):
	if (Input.is_action_pressed("shoot") and can_shoot == true):
		var resource = load("res://player_bullet.tscn")
		var bullet = resource.instance()
		add_child(bullet)
		can_shoot = false
		$PlayerShotTimer.start()
	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
	
func _on_PlayerShotTimer_timeout():
	can_shoot = true
