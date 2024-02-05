extends Node

var type : int
var id : int
var upgrades : Array
var health : int

# Class Constructor
func _init(construct_type : int, construct_id : int,):
	type = construct_type
	id = construct_id
	upgrades = []
	health = 0
	
func add_upgrade(upgrade):
	upgrades.append(upgrade)

func add_health(change):
	health += change

func set_health(change):
	health = change

func _process(delta):
	pass
