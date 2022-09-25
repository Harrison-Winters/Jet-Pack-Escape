extends Node2D

signal win


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_click_blocks_move():
	get_tree().call_group("ObstaclesPart1", "update_velocity")
#	$Obstacles.update_velocity()

func _on_WinArea_win():
	emit_signal("win")
