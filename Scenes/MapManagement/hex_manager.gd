extends Node

var hex_list : Array
@onready var hex = preload("res://Scenes/MapManagement/hex.tscn")
@onready var terrain_generator = $TerrainGenerator
@onready var tile_map = $"../TileMap"

signal generate_terrain

# Called when the node enters the scene tree for the first time.
func _ready():
	hex_list = init_hex_list(Vector2i(32, 32)) # Should probably implement a better hex list class to allow use of list.coords
	print(hex_list[1023].coords)
	terrain_generator.tile_map = tile_map 
	terrain_generator.tile_set = tile_map.tile_set
	terrain_generator.generate_terrain()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func init_hex_list(size):
	var list = []
	for i in range(size.y):
		for j in range(size.x):
			var current_hex = hex.instantiate()
			current_hex.coords = Vector2i(i, j)
			current_hex.tile = Vector2.ZERO
			list.append(current_hex)
	return list
