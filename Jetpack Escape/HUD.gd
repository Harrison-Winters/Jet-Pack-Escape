extends CanvasLayer

signal restart_game
signal start_game


func _ready():
	pass 

func update_lives(lifeCount):
	#print("updating lives: " + str(lifeCount))
	$LifeCounter.text = "Lives: " + str(lifeCount)
	
func update_score(score):
	#print("updating score: " + str(score))
	$ScoreCounter.text = "Score: " + str(score)

func show_game_over():
	$GameOverText.show()
	$RestartPauseTimer.start()
	$LifeCounter.hide()
	yield($RestartPauseTimer, "timeout")
	$StartButton.show()
	emit_signal("restart_game")

#
func _on_StartButton_pressed():
	$StartButton.hide()
	$ScoreCounter.show()
	$LifeCounter.show()
	emit_signal("start_game")
	
func _on_Part1_win():
	$WinText.show()
	$RestartPauseTimer.start()
	yield($RestartPauseTimer, "timeout")
	$StartButton.show()
	emit_signal("restart_game")
