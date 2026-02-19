extends Node2D

@onready var texture = NoiseTexture2D.new()
@export var textureRect = TextureRect

@onready var xOff = 0
@onready var yOff = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture.set_width(2000)
	texture.set_height(2000)
	texture.noise = FastNoiseLite.new()
	texture.noise.set_noise_type(3)
	texture.noise.seed = randi()
	#texture.noise.set_domain_warp_enabled(true)
	#texture.noise.set_domain_warp_amplitude(200.0)
	await texture.changed
	var image = texture.get_image()
	var data = image.get_data()
	textureRect.texture = texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	xOff += delta * 80.0
	yOff += delta * 80.0
	texture.noise.offset = Vector3(xOff, yOff, 0.0)
	pass
	
#func _input(inp: InputEvent) -> void:
	#if inp.
	#pass
