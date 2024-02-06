extends Node

@onready var terrain_generator = $TerrainGenerator
@onready var tile_map = $TileMap
@export var generation_seed = 42
@export var size = Vector2i(32, 32)
# var hex = preload("")
var tile_list : Array
var hex_list : Array
# Called when the node enters the scene tree for the first time.
func _ready():
	terrain_generator.initialize_generator(tile_map, generation_seed, size)
	terrain_generator.generate_terrain()

func initiate_hex_list():
	pass
	"""for i in range(size.x * size.y):
		hex_list.append(hex)"""

func _on_tile_mapper_tile_list_ready(list):
	tile_list = list
