extends Node2D

var lives
var score = 0


func _ready():
#	$HUD/StartButton.show()\
	var y = yield($HUD, "start_game")
	lives = 3
	score = 0
	$HUD.update_lives(lives)
	$HUD.update_score(score)
#	get_tree().call_group("ObstacleGroup", "update_velocity")
	$BGM.play()
	$Part1._on_start_click_blocks_move();
	
	
	


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
		$ScoreTimer.stop()

func new_game():
	get_tree().reload_current_scene()
	
#	$HUD/StartButton.show()
	var y = yield($HUD, "start_game")
	$Part1._on_start_click_blocks_move();

func _on_HUD_restart_game():
	get_tree().reload_current_scene()
	
#	$HUD/StartButton.show()
#	var y = yield($HUD, "restart_game")
	$BGM.play()
	$Part1._on_start_click_blocks_move();
#func initial_game():
#	var y = yield($HUD, "start_game")
#	get_tree().call_group("ObstacleGroup", "update_velocity")


func _on_ScoreTimer_timeout():
	#	Update the score every second
	score = score + 1
	$HUD.update_score(score)


func _on_HUD_stop_score():
	$BGM.stop()
	$ScoreTimer.stop()
