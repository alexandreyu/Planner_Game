class_name SaverLoader
extends Node
var saving = false
var loading = false
@onready var tile_map = $"../../WorldRoot/Map/HexManager/TileMap"


func _physics_process(delta):
	if Input.is_action_pressed("Quick Save") and not saving and not loading:
		saving = true
		save_game()
	elif not Input.is_action_pressed("Quick Save"):
		saving = false

	if Input.is_action_pressed("Quick Load") and not loading and not saving:
		loading = true
		load_game()
	elif not Input.is_action_pressed("Quick Load"):
		loading = false

func save_game():
	var file = FileAccess.open("res://Saves/save_game.data", FileAccess.WRITE)
	file.store_var(tile_map.global_scale)
	file.close()
	print("Saved Game")
func load_game():
	var file = FileAccess.open("res://Saves/save_game.data", FileAccess.READ)
	file.close()
	print("Loaded Game")

