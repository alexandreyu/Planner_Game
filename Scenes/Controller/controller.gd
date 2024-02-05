extends CharacterBody2D

# Constants
const MAX_SPEED = 50000
const ACCELERATION = 10000
const FRICTION = 5000
const ZOOM_SPEED = 5
const MAX_ZOOM = 3
const MIN_ZOOM = 0.1

# Variables
var input_vector = Vector2.ZERO
var speed_vector = Vector2.ZERO
var zoom_input = 0
var zoom = 1.0
var is_dragging = false


# References
@onready var camera_2d = $Camera2D

var mouse_start_pos
var screen_start_position


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			is_dragging = true
		else:
			is_dragging = false
	elif event is InputEventMouseMotion and is_dragging:
		var inverse_zoom = Vector2.ZERO
		inverse_zoom.x = 1/(camera_2d.zoom.x)
		inverse_zoom.y = 1/(camera_2d.zoom.y)
		position = inverse_zoom * (mouse_start_pos - event.position) + screen_start_position
	

func _physics_process(delta):
	# Input Handling
	input_vector.x = Input.get_axis("Movement Left", "Movement Right")
	input_vector.y = Input.get_axis("Movement Up", "Movement Down")
	input_vector = input_vector.normalized()
	
	if Input.is_action_just_pressed("Zoom In"):
		zoom_input = 1
	elif Input.is_action_just_pressed("Zoom Out"):
		zoom_input = -1
	else:
		zoom_input = 0
	
	
	
	
	
	# Camera Zoom
	if (zoom_input > 0) and (MAX_ZOOM > zoom):
		zoom += ZOOM_SPEED * delta
	
	elif (zoom_input < 0) and (MIN_ZOOM < zoom):
		zoom += -ZOOM_SPEED * delta
	
	if zoom > MAX_ZOOM:
		zoom = MAX_ZOOM
	
	if zoom < MIN_ZOOM:
		zoom = MIN_ZOOM
	
	var zoom_vector = Vector2.ZERO
	zoom_vector.x = zoom
	zoom_vector.y = zoom
	camera_2d.zoom = zoom_vector
	
	
	
	
	
	# Camera Movement
	if input_vector.x != 0:
		speed_vector.x = move_toward(speed_vector.x, MAX_SPEED * input_vector.x, ACCELERATION)
	else:
		speed_vector.x = move_toward(speed_vector.x, 0, FRICTION)
	
	if input_vector.y != 0:
		speed_vector.y = move_toward(speed_vector.y, MAX_SPEED * input_vector.y, ACCELERATION)
	else:
		speed_vector.y = move_toward(speed_vector.y, 0, FRICTION)
	
	velocity = (speed_vector/zoom) * delta
	move_and_slide()
