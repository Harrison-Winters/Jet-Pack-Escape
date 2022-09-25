extends "res://enemy.gd"

var aimPosition = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player_position():
	var player = get_node_or_null("../PlayerCollisionObject")
	aimPosition = null
	if player != null:
		aimPosition = player.global_position 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_player_position()
	if aimPosition != null:
		look_at(aimPosition)
	else:
		look_at(Vector2.DOWN)
	pass
