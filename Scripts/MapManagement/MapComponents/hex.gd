extends Node


var coords : Vector2i
var tile : Vector2i
var resource : Array
var buildings : Array

func _ready():
	tile = Vector2i.ZERO
	buildings = [null, null]
	
func change_tile(to_tile):
	tile = to_tile

func change_building(slot, building):
	buildings[slot] = building
