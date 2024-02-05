extends Node

@export var tile_map : TileMap

@export var generation_seed : int
@export var width = 64
@export var height = 64

var size = Vector2i(width, height)

signal start_terrain_generation

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_terrain()

func generate_terrain():
	start_terrain_generation.emit()


func _on_tile_mapper_signal_sudoku():
	print("Generation finished, destroying generator")
	queue_free()
