extends Node2D

@onready var hex_manager = $HexManager
@onready var unit_manager = $UnitManager


func _on_end_turn_button_pressed():
	hex_manager.next_turn()
	unit_manager.next_turn()
	
