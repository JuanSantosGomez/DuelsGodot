extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion=Vector2()
var thrust=10
const MAXSPEED=900
const MAXFALLSPEED=2000
const GRAVITY=80
var shifter=1
const UP=Vector2(0,-1)
var jumped=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if Input.is_action_pressed("space"):
		if not jumped:
			motion.y=-MAXSPEED*2
			jumped=true
			get_parent().get_node("Player").get_node("anim").get_node("AnimationPlayer").play("Running")
	else:
		
		jumped=false
		if Input.is_action_pressed("shift"):
			shifter=1.5
			get_parent().get_node("Player").get_node("anim").get_node("AnimationPlayer").playback_speed=1.5
			get_parent().get_node("Player").get_node("anim").rotation_degrees=get_parent().get_node("Player").get_node("anim").scale.x*130
		else:
			shifter=1
			get_parent().get_node("Player").get_node("anim").get_node("AnimationPlayer").playback_speed=1
			get_parent().get_node("Player").get_node("anim").rotation_degrees=0
		if Input.is_action_pressed("ui_right"):
			motion.x+=(MAXSPEED*shifter-motion.x)/14
			get_parent().get_node("Player").get_node("anim").get_node("AnimationPlayer").play("Running")
			get_parent().get_node("Player").get_node("anim").scale.x=abs(get_parent().get_node("Player").get_node("anim").scale.x)
		elif Input.is_action_pressed("ui_left"):
			motion.x+=((-MAXSPEED*shifter)-motion.x)/14
			get_parent().get_node("Player").get_node("anim").get_node("AnimationPlayer").play("Running")
			get_parent().get_node("Player").get_node("anim").scale.x=abs(get_parent().get_node("Player").get_node("anim").scale.x)*(-1)
		else:
			motion.x+=(-motion.x)/10
			get_parent().get_node("Player").get_node("anim").get_node("AnimationPlayer").play("Idle")
	
	motion.y+=GRAVITY
	if motion.y>MAXFALLSPEED:
		motion.y=MAXFALLSPEED
	
	motion=get_parent().get_node("Player").move_and_slide(motion,UP)
