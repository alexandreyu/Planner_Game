extends Node

var coords : Vector2i
var tile : Vector2i
var buildings : Array
var units : Array

func _ready():
	tile = Vector2i.ZERO
	buildings = [null, null]
	units = [null, null]
	
func change_tile(to_tile):
	tile = to_tile

func change_building(slot, building):
	buildings[slot] = building

func change_unit(slot, unit):
	units[slot] = unit
