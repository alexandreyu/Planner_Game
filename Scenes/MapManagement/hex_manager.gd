extends Node

@onready var terrain_generator = $TerrainGenerator
@onready var tile_map = $TileMap

@export var generation_seed = 42
@export var size = Vector2i(32, 32)
var hex
var tile_list = []
var hex_list = []
var hex_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	hex = preload("res://Scenes/MapManagement/MapComponents/hex.tscn")
	terrain_generator.initialize_generator(tile_map, generation_seed, size)
	terrain_generator.generate_terrain()

func _on_tile_mapper_tile_list_ready(list):
	tile_list = list
	for j in range(size.y):
		for i in range(size.x):
			var current_hex = hex.instantiate()
			current_hex.coords.x = i
			current_hex.coords.y = j
			hex_list.append(current_hex)
	
	generate_hex_dict(create_vector2_coordinates(size), hex_list)
	print(hex_dict)

func create_vector2_coordinates(size):
	var coords = []
	for j in range(size.y):
		for i in range(size.x):
			coords.append(Vector2i(i, j))
	return coords

func generate_hex_dict(coords, hexes):
	for i in range(len(hexes)):
		hex_dict[coords[i]] = hexes[i]
