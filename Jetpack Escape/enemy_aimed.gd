extends "res://enemy.gd"

var aimPosition = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player_position():
	aimPosition = get_node("../PlayerCollisionObject").global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_player_position()
	look_at(aimPosition)
	pass
