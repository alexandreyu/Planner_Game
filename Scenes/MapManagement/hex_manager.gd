extends Node

@onready var terrain_generator = $TerrainGenerator
@onready var tile_map = $TileMap
@export var generation_seed = 42
@export var size = Vector2i(32, 32)
# Called when the node enters the scene tree for the first time.
func _ready():
	terrain_generator.initialize_generator(tile_map, generation_seed, size)
	print("Init generator")
	terrain_generator.generate_terrain()
