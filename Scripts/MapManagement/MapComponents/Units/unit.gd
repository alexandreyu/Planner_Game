extends Node2D
var coords : Vector2i
var health : int
var type : int
var spec : int
var movement : Vector2i
# var movement_points : float

@onready var label = $Label
@onready var hex_manager = $"../../HexManager"
@onready var cursor = $"../../../Cursor"
@onready var frame = $Frame

@onready var size = hex_manager.size
@onready var tile_map = hex_manager.tile_map

# Handling unit movement
var is_cursor_on = false
var is_selected = false
var movement_update = false
var mouse_position : Vector2
var mouse_coords : Vector2i
var movement_vector : Vector2i
# NE = D, E = E, SE = F, SW = V, W = W, NW = X


# Called when the node enters the scene tree for the first time.
func _ready():
	# movement_points = 10
	coords = Vector2i(4, 4)
	health = 100
	position = tile_map.map_to_local(coords)

func take_damage(damage):
	health -= damage

func move_with_mouse(cost):
	movement = movement_vector
	movement_update = true
	# movement_points -= cost

func update():
	# movement_points = 10
	movement_vector = Vector2i.ZERO
	# coords = Vector2i(3, 3)

func movement_vector_update():
	movement_vector = Vector2i(round(mouse_coords.x - coords.x), (round(mouse_coords.y - coords.y)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	label.text = str(movement_vector)
	
	# Movement handling
	mouse_coords = tile_map.local_to_map(get_global_mouse_position())
	if is_cursor_on:
		if Input.is_action_just_pressed("Left Click"):
			is_selected = true
			frame.visible = true
	
	if is_selected:
		movement_vector_update()
			
	if Input.is_action_just_pressed("Left Click") and is_selected and not is_cursor_on:
		is_selected = false
		frame.visible = false
	
	if Input.is_action_just_pressed("Right Click") and is_selected: # and movement_points > 0:
		move_with_mouse(1)
	if movement_update: # and movement_points > 0:
		coords += movement
		position = tile_map.map_to_local(coords)
		movement = Vector2i.ZERO
		movement_update = false
	elif movement_update:
		movement_update = false




func _on_area_2d_mouse_entered():
	is_cursor_on = true
	


func _on_area_2d_mouse_exited():
	is_cursor_on = false
