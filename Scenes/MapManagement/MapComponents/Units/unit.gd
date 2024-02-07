extends Node2D
var coords : Vector2i
var health : int
var type : int
var spec : int
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 100
	pass # Replace with function body.

func take_damage(damage):
	health -= damage
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("Damage"):
		take_damage(10)
	label.text = str(health)
