extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_global_mouse_position().x<global_position.x:
		scale.y=abs(scale.y)*-1*(get_parent().get_parent().scale.x/abs(get_parent().get_parent().scale.x))
	else:
		scale.y=abs(scale.y)*(get_parent().get_parent().scale.x/abs(get_parent().get_parent().scale.x))
	if scale.y*(get_parent().get_parent().scale.x/abs(get_parent().get_parent().scale.x))>0:
		if abs((get_global_mouse_position()-global_position).angle())<PI/4:
			look_at(get_global_mouse_position())
		else:
			global_rotation=0
	else:
		if (((get_global_mouse_position()-global_position).angle()<-PI*3/4) and ((get_global_mouse_position()-global_position).angle()>-PI)) or (((get_global_mouse_position()-global_position).angle()>PI*3/4) and ((get_global_mouse_position()-global_position).angle()<PI)):
			look_at(get_global_mouse_position())
		else:
			global_rotation=PI
