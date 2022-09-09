extends KinematicBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		var velocity = Vector2.LEFT * 400
		position += velocity * delta
	if Input.is_action_pressed("ui_right"):
		var velocity = Vector2.RIGHT * 400
		position += velocity * delta
	if Input.is_action_pressed("ui_up"):
		var velocity = Vector2.UP * 400
		position += velocity * delta	
	if Input.is_action_pressed("ui_down"):
		var velocity = Vector2.DOWN * 400
		position += velocity * delta	
