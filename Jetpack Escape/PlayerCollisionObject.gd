extends KinematicBody2D

var screen_size = Vector2.ZERO

onready var invincibilityTimer := $InvincibilityTimer
onready var shieldSpirite := $Shield
onready var shieldDelayTimer := $ShieldDelayTimer

export var damageInvincibilityTimer := 2.0

export var shieldDelay: float = 3.0
var can_shoot = true


func _ready():
	screen_size = get_viewport_rect().size
	shieldSpirite.visible = false
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		var velocity = Vector2.LEFT * 400
		move_and_collide(velocity * delta)
#	
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
	
	if Input.is_action_pressed("ui_parry") and shieldDelayTimer.is_stopped():
		shieldDelayTimer.start(shieldDelay)
		invincibilityTimer.start(damageInvincibilityTimer)
		shieldSpirite.visible = true
#


func damage(amount: int):
	
	if !invincibilityTimer.is_stopped():
		return
	

func _process(delta):
	if (Input.is_action_pressed("shoot") and can_shoot == true):
		var resource = load("res://player_bullet.tscn")
		var bullet = resource.instance()
		owner.add_child(bullet)
		bullet.transform = $PlayerShootPosition.global_transform
		can_shoot = false
		$PlayerShotTimer.start()
	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
	
	


func _on_InvincibilityTimer_timeout():
	shieldSpirite.visible = false
func _on_PlayerShotTimer_timeout():
	can_shoot = true
