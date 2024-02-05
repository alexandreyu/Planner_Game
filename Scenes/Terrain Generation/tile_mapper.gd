extends Node


@onready var terrain_generator = $".."
@onready var noise_generator = $"../NoiseGenerator"



@onready var tile_map = terrain_generator.tile_map
@onready var tile_set = tile_map.tile_set

var terrain_layer = 0
var div = 3

signal signal_sudoku

func _on_noise_generator_noise_ready():
	var data = noise_generator.data
	var coords = create_vector2_coordinates(terrain_generator.size)
	print(coords[140])
	var tile_list = noise_to_tile(data, div)
	
	var source_id = 0
	
	var atlas_coord = Vector2i.ZERO
	
	# Fix image reversed
	
	for i in range(len(tile_list)):
		atlas_coord.x = tile_list[int(i)]
		
		tile_map.set_cell(terrain_layer, coords[i], source_id, atlas_coord)
	
	sudoku()
	


func create_vector2_coordinates(size):
	var coords = []
	for i in range(size.y):
		for j in range(size.x):
			coords.append(Vector2i(j, i))
	return coords

func noise_to_tile(noise, division):
	var noise_stepped = []
	var tile_list = []
	for i in noise:
		noise_stepped.append(i*division)
	for i in noise_stepped:
		tile_list.append(floor(i))
	return tile_list

func sudoku():
	signal_sudoku.emit()
