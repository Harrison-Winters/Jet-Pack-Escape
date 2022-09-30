extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isScrolling = false
var velocity = Vector2.DOWN * 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (isScrolling):
		rect_position += velocity * delta


func _on_HUD_start_game():
	isScrolling = true
