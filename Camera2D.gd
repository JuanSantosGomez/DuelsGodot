extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var xe

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position+=((get_parent().get_node("Player").global_position+((get_parent().get_node("Player").global_position-get_global_mouse_position()))/-2)-global_position)/1000
	xe=(get_parent().get_node("Player").global_position-get_global_mouse_position()).length()/500
	if(xe>1.5):
		xe=1.5
	elif xe<1:
		xe=1
	zoom+=((Vector2(1,1)*xe)-zoom)/2000
	get_parent().get_node("unmoved").position.x=position.x
	get_parent().get_node("moveslight").position.x=position.x*.6
	get_parent().get_node("movesfast").position.x=position.x*-1.03
	

	
	
