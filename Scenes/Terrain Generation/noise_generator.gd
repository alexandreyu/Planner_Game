extends Node
var texture = NoiseTexture2D.new()

@onready var terrain_generator = $".."

signal noise_ready

var data

func image_to_grayness(image):
	var grayness = []
	for i in image.get_height():
		for j in image.get_width():
			grayness.append(image.get_pixel(i, j)[0])
	return grayness

func _on_terrain_generator_start_terrain_generation():
	texture.width = terrain_generator.size.x
	texture.height = terrain_generator.size.y
	
	var noise = FastNoiseLite.new()
	noise.noise_type = 0
	noise.frequency = 0.04
	noise.set_seed(terrain_generator.generation_seed)
	
	texture.noise = noise
	await texture.changed
	var image = texture.get_image()
	data = image_to_grayness(image)
	noise_ready.emit()
