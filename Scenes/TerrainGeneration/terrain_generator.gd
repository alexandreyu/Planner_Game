extends Node

@onready var tile_map : TileMap
@onready var tile_set = tile_map.tile_set
@export var generation_seed : int
@export var width = 32
@export var height = 32
@onready var noise_generator = $NoiseGenerator

var size = Vector2i(width, height)


func generate_terrain():
	noise_generator.generate()


func _on_tile_mapper_signal_sudoku():
	pass
	"""print("Generation successful, destroying generator")
	queue_free()"""
