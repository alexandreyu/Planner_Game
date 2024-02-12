extends Node
var unit_scene = preload("res://Scenes/MapManagement/MapComponents/Units/unit.tscn")
@onready var map = $".."
@onready var turn_number = map.turn_number
var unit_count = 0

func _enter_tree():
	unit_count = get_child_count()

func update_units():
	
	for unit in get_children():
		unit.update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func next_turn():
	update_units()
