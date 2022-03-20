extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gotoPosition=Vector2(-42,326)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position+=(gotoPosition-global_position)/1
	print(global_position)
