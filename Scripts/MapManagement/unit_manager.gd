extends Node


func update_units():
	for unit in get_children():
		unit.update()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func next_turn():
	update_units()

