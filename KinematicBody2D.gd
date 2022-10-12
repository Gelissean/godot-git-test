extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var delta_x = 0
	var delta_y = 0
	if(Input.is_action_pressed("ui_up")):
		delta_y = -speed*delta
	if(Input.is_action_pressed("ui_down")):
		delta_y = speed*delta
	if(Input.is_action_pressed("ui_left")):
		delta_x = -speed*delta
	if(Input.is_action_pressed("ui_right")):
		delta_x = speed*delta
	if(delta_x != 0 || delta_y != 0):
		print(delta_x, delta_y)
	move_and_collide(Vector2(delta_x,delta_y))
