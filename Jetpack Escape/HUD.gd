extends CanvasLayer

signal restart_game
signal start_game


func _ready():
	pass 


func show_game_over():
	$GameOverText.show()
	$RestartPauseTimer.start()
	yield($RestartPauseTimer, "timeout")
	$StartButton.show()
	emit_signal("restart_game")

#
func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
