extends Node
var texture = NoiseTexture2D.new()

@onready var terrain_generator = $".."
@onready var sprite_2d = $"../Sprite2D"

signal noise_ready

var data

func image_to_value(image):
	var value = []
	for j in image.get_height():
		for i in image.get_width():
			value.append(image.get_pixel(i, j)[0])
	return value

func generate():
	texture.width = terrain_generator.size.x
	texture.height = terrain_generator.size.y
	
	var noise = FastNoiseLite.new()
	noise.noise_type = 0
	noise.frequency = 0.01
	noise.set_seed(terrain_generator.generation_seed)
	
	texture.noise = noise
	await texture.changed
	var image = texture.get_image()
	sprite_2d.texture = texture
	data = image_to_value(image)
	noise_ready.emit()
