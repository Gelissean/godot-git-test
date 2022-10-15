extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$logger.add_text("any loggers in chat?")
	manage_host()
	detect_controllers()

func detect_controllers():
	print_log("detecting controllers")
	var list = Input.get_connected_joypads()
	print_log("number of connected controllers: " + str(list.size()))
	if list.size() > 0:
		pick_controller(0)
	else:
		print_log("no controller assigned")
	print_log("you can press Escape to redetect")
	
func pick_controller(controller_id):
	print_log("Picking controller: " + Input.get_joy_name(controller_id))
	$KinematicBody2D.attach_controller(controller_id)
	
func print_log(text):
	$logger.add_text("\n")
	$logger.add_text(text)
	
func manage_host():
	print_log("system detected " + OS.get_name())
	if OS.get_name() == "Android":
		print_log("printing on screen controls")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		print_log("rechecking controllers")
		detect_controllers()
