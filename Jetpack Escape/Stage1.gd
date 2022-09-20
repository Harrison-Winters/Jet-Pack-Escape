extends Node2D


func _ready():
#	$HUD/StartButton.show()\
	var y = yield($HUD, "start_game")
	get_tree().call_group("ObstacleGroup", "update_velocity")

	



func _process(delta):
	
#	GAME OVER Condition
	if $PlayerCollisionObject.position.y > 800:
		$PlayerCollisionObject.visible = false
		$PlayerCollisionObject.position.x = 254
		$PlayerCollisionObject.position.y = 638
		$HUD.show_game_over()
#		$StartTimer.start()
#		Clear all obstacles from the screen
		get_tree().call_group("ObstacleGroup", "queue_free")

func new_game():
	get_tree().reload_current_scene()
	
#	$HUD/StartButton.show()
	var y = yield($HUD, "start_game")
	get_tree().call_group("ObstacleGroup", "update_velocity")


#func initial_game():
#	var y = yield($HUD, "start_game")
#	get_tree().call_group("ObstacleGroup", "update_velocity")
