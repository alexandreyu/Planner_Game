extends Node
class_name Building

var id : int
var upgrades : Array
var yields : Array
var status : int

# Class Constructor
func _init(construct_id : int):
	id = construct_id
	upgrades = []
	yields = [0, 0, 0, 0]
	status = 0
	
func add_upgrade(upgrade):
	upgrades.append(upgrade)

func set_status(change):
	status = change

func process_yields():
	pass

func _process(delta):
	pass
