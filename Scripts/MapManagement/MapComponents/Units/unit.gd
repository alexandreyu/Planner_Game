extends Node2D
var coords : Vector2i
var health : int
var type : int
var spec : int

var movement : Vector2i
@onready var label = $Label
@onready var hex_manager = $"../../HexManager"
@onready var hex_size = hex_manager.hex_size
@onready var tile_map = hex_manager.tile_map
# Handling unit movement
var is_selected = false
var movement_update = false
# NE = D, E = E, SE = F, SW = V, W = W, NW = X


# Called when the node enters the scene tree for the first time.
func _ready():
	coords = Vector2i(5, 5)
	health = 100
	position = tile_map.map_to_local(coords)

func take_damage(damage):
	health -= damage

func move(direction):
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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("Damage"):
		take_damage(10)
	if Input.is_action_just_pressed("Move"):
		move("X")
	if movement_update:
		coords += movement
		position = tile_map.map_to_local(coords)
		
		movement = Vector2i.ZERO
		movement_update = false
	label.text = str(health)
