extends Node2D

@onready var moveComponent: MoveComponent = $MoveComponent as MoveComponent
@onready var moveInputComponent: MoveInputComponent = $MoveInputComponent as MoveInputComponent
@onready var positionClampComponent: PositionClampComponent = $PositionClampComponent as PositionClampComponent
@onready var spawnerComponent: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var weaponInputComponent: WeaponInputComponent = $WeaponInputComponent as WeaponInputComponent

var rotationDeadzone:float = 0.2
var rotationSpeed:float = 5.
var targetAngle:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	weaponInputComponent.weaponFired.connect(fire_weapon)
	
func _process(delta: float) -> void:
	var inputDirection := Vector2(
		Input.get_joy_axis(0, JOY_AXIS_RIGHT_X),
		Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
	)
	if inputDirection.length() >= rotationDeadzone:
		targetAngle = inputDirection.angle() + deg_to_rad(90)
		
	if rotation != targetAngle:
		var rotationLerpWeight := 1. - exp(-rotationSpeed * delta)
		rotation = lerp_angle(rotation, targetAngle, rotationLerpWeight)
	#look_at(get_viewport().get_mouse_position())
	
func fire_weapon() -> void:
	var bullet = spawnerComponent.spawn(global_position, %Projectiles) as Bullet
	bullet.rotation_degrees = rotation_degrees
