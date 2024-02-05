extends Node

class_name Hex

var coords : Vector2i
var tile_type : Vector2i
var buildings : Array
var units : Array

# Class Constructor
func _init(construct_coords : Vector2i, construct_tile_type : Vector2i):
	coords = construct_coords
	tile_type = construct_tile_type
	buildings = [null, null] # Each hex has an active (eg solar farm) and passive (eg road) building slot, represented respectively by buildings[0] and buildings[1]
	units = [null, null] # Each hex has an active (eg military) and civilian (eg worker) unit slot, represented respectively by units[0] and units[1]
	
func set_building(slot, building):
	buildings[slot] = building

func set_unit(slot, unit):
	units[slot] = unit

