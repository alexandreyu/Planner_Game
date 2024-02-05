extends Node

@onready var hex_list : Array
var hex = preload("res://Scenes/Map Management/hex.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	hex_list = init_hex_list(32) # Should probably implement a better hex list class to allow use of list.coords

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func init_hex_list(size):
	var list = []
	for i in range(size):
		var coords = Vector2i.ZERO
		coords.x = i
		list.append(hex.new(coords, Vector2i.ZERO))
	return list
