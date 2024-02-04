extends Node

class_name Hex

var coords : Vector2i
var tile_type : int
var buildings : Array
var units : Array

# Class Constructor
func _init(construct_coords : Vector2i, construct_tile_type : int):
	coords = construct_coords
	tile_type = construct_tile_type
	buildings = [-1, -1] # Each hex has an active (eg solar farm) and passive (eg road) building slot, represented respectively by buildings[0] and buildings[1]
	units = [-1, -1] # Each hex has an active (eg military) and civilian (eg worker) unit slot, represented respectively by units[0] and units[1]
	
func edit_building(slot, id):
	pass
