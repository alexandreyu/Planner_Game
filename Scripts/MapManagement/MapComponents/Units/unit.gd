extends Node2D
var coords : Vector2i
var health : int
var type : int
var spec : int

var movement : Vector2i
var movement_points : float

@onready var label = $Label
@onready var hex_manager = $"../../HexManager"
@onready var cursor = $"../../../Cursor"

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
	movement_points = 2
	coords = Vector2i(15, 15)
	health = 100
	position = tile_map.map_to_local(coords)

func take_damage(damage):
	health -= damage

func move(direction, cost):
	if direction == "D":
		movement.x += (coords.y % 2)
		movement.y += -1

	if direction == "E":
		movement.x += 1

	if direction == "F":
		movement.x += (coords.y % 2)
		movement.y += 1

	if direction == "V":
		movement.x += -((coords.y + 1) % 2)
		movement.y += 1
	
	if direction == "W":
		movement.x += -1
	
	if direction == "X":
		movement.x += -((coords.y + 1) % 2)
		movement.y += -1
	movement_update = true
	print("Moved")
	movement_points -= cost

func update():
	movement_points = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Movement handling
	mouse_coords = tile_map.local_to_map(get_global_mouse_position())
	if is_cursor_on:
		if Input.is_action_just_pressed("Left Click"):
			is_selected = true
			print("Is Selected")
			
	if Input.is_action_just_pressed("Left Click") and is_selected and not is_cursor_on:
		is_selected = false
		print("Is Unselected")
	
	if Input.is_action_just_pressed("Right Click") and is_selected:
		movement_vector = Vector2i(round(mouse_coords.x - coords.x), (round(mouse_coords.y - coords.y))) # Not correct, must include correction for offset y
		print(movement_vector)
		if movement_vector.x == 1 and movement_vector.y == -1:
			move("D", 1)
		elif movement_vector.x == 1 and movement_vector.y == 0:
			move("E", 1)
		elif movement_vector.x == 1 and movement_vector.y == 1:
			move("F", 1)
		elif movement_vector.x == 0 and movement_vector.y == 1:
			move("V", 1)
		elif movement_vector.x == -1 and movement_vector.y == 0:
			move("W", 1)
		elif movement_vector.x == 0 and movement_vector.y == -1:
			move("X", 1)
		movement_vector = Vector2i.ZERO



	if movement_update and movement_points >= 1:
		coords += movement
		position = tile_map.map_to_local(coords)
		movement = Vector2i.ZERO
		movement_update = false
	elif movement_update:
		movement_update = false
	
	label.text = str(health)




func _on_area_2d_mouse_entered():
	is_cursor_on = true
	


func _on_area_2d_mouse_exited():
	is_cursor_on = false
