extends Node

var tile_dict : Dictionary

func generate_tile_dict(coords, hexes):
	for i in range(hexes):
		tile_dict[coords[i]] = hexes[i]
