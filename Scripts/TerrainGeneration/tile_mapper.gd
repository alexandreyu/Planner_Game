extends Node

@onready var terrain_generator = $".."
@onready var noise_generator = $"../NoiseGenerator"


var terrain_layer = 0
var div = 3

signal signal_sudoku
signal tile_list_ready(list)
func _on_noise_generator_noise_ready():
	var data = noise_generator.data
	var coords = create_vector2_coordinates(terrain_generator.size)
	
	var tile_map = terrain_generator.tile_map
	var tile_list = noise_to_tile(data, div)
	tile_list_ready.emit(tile_list)
	
	var source_id = 0
	
	var atlas_coord = Vector2i.ZERO
	
	for i in range(len(tile_list)):
		atlas_coord.x = tile_list[int(i)]
		
		tile_map.set_cell(terrain_layer, coords[i], source_id, atlas_coord)
	sudoku()


func create_vector2_coordinates(size):
	var coords = []
	for j in range(size.y):
		for i in range(size.x):
			coords.append(Vector2i(i, j))
	return coords

func noise_to_tile(noise, division):
	var noise_stepped = []
	var tile_list = []
	for i in noise:
		noise_stepped.append(i*division)
	for i in noise_stepped:
		if floor(i) == division:
			tile_list.append(floor(i) - 1)
		else:
			tile_list.append(floor(i))
	return tile_list

func sudoku():
	signal_sudoku.emit()
