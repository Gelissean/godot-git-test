extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100
var controller_id = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var delta_movement = process_keyboard(delta)
	if controller_id != null and (delta_movement.x == 0 and delta_movement.y == 0):
		delta_movement = process_controller(delta)
	
	if(delta_movement.x != 0 || delta_movement.y != 0):
		print(delta_movement.x, delta_movement.y)
	move_and_collide(delta_movement)

func process_keyboard(delta):
	var d = Vector2(0,0)
	if(Input.is_action_pressed("ui_up")):
		d.y = -speed*delta
	if(Input.is_action_pressed("ui_down")):
		d.y = speed*delta
	if(Input.is_action_pressed("ui_left")):
		d.x = -speed*delta
	if(Input.is_action_pressed("ui_right")):
		d.x = speed*delta
	return d
	
func process_controller(delta):
	var x = Input.get_joy_axis(controller_id, JOY_AXIS_0)
	if abs(x)<0.1:
		x = 0
	var y = Input.get_joy_axis(controller_id, JOY_AXIS_1)
	if abs(y)<0.1:
		y = 0
	return delta * speed * (Vector2(x, y))

func attach_controller(controller_id):
	self.controller_id = controller_id
