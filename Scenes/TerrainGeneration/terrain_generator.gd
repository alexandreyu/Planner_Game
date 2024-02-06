extends Node

var tile_map : TileMap
var tile_set : TileSet
var generation_seed : int
var size : Vector2i
@onready var noise_generator = $NoiseGenerator

func initialize_generator(in_tile_map, in_generation_seed, in_size):
	tile_map = in_tile_map
	tile_set = tile_map.tile_set
	generation_seed = in_generation_seed
	size = in_size


func generate_terrain():
	noise_generator.generate()


func _on_tile_mapper_signal_sudoku():
	pass
	"""print("Generation successful, destroying generator")
	queue_free()"""
