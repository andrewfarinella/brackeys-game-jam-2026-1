extends Node2D

@onready var texture = NoiseTexture2D.new()
@export var textureRect = TextureRect

var xOff = 0
var yOff = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture.set_width(1000)
	texture.set_height(500)
	texture.noise = FastNoiseLite.new()
	texture.noise.frequency = 0.008
	texture.noise.set_noise_type(3)
	texture.noise.seed = randi()
	texture.color_ramp = Gradient.new()
	texture.color_ramp.set_offset(0, 0.4)
	texture.color_ramp.set_offset(1, 0.8)
	texture.color_ramp.set_color(0, Color(0.686, 0.0, 0.0, 0.2))
	texture.color_ramp.set_color(1, Color(0.789, 0.567, 0.578, 0.3))
	await texture.changed
	var image = texture.get_image()
	var data = image.get_data()
	scale = Vector2(5.0, 5.0)
	textureRect.texture = texture
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	xOff += delta * 15.0
	texture.noise.offset = Vector3(xOff, yOff, 0.0)
	pass
