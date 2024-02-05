extends Node
class_name Building

var coords : Vector2i
var tile_type : Vector2i
var buildings : Array
var units : Array

# Class Constructor
func _init(construct_coords : Vector2i, construct_tile_type : Vector2i):
	coords = construct_coords
	tile_type = construct_tile_type
	buildings = [null, null] # Each hex has an active (eg solar farm) and passive (eg road) building slot, represented respectively by buildings[0] and buildings[1]
	units = [null, null]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
