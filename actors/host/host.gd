class_name HostCharacter
extends Node2D

@onready var moveComponent: MoveComponent = $MoveComponent as MoveComponent
@onready var positionClampComponent: PositionClampComponent = $PositionClampComponent as PositionClampComponent
@onready var weaponInputComponent: WeaponInputComponent = $WeaponInputComponent as WeaponInputComponent
@onready var hurtboxComponent: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var weapon: Weapon = $Weapon
@onready var damageComponent: DamageComponent = $DamageComponent
@onready var camera:Camera2D = $Camera2D

var rotationDeadzone:float = 0.2
var rotationSpeed:float = 5.
var targetAngle:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	weaponInputComponent.weaponFired.connect(fire_weapon)
	EventHub.subAcknowledged.connect(_on_sub_acknowledged)
	#damageComponent.damageTaken.connect(push_back)
	
func _process(delta: float) -> void:
	%SubThanks.rotation = -rotation
	if GameManager.inputScheme == GameManager.InputScheme.KBM:
		look_at(get_global_mouse_position())
		rotate(deg_to_rad(90))
	else:
		var inputDirection := Vector2(
			Input.get_joy_axis(0, JOY_AXIS_RIGHT_X),
			Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
		)
		
		if inputDirection.length() >= rotationDeadzone:
			targetAngle = inputDirection.angle() + deg_to_rad(90)
			
		if rotation != targetAngle:
			var rotationLerpWeight := 1. - exp(-rotationSpeed * delta)
			rotation = lerp_angle(rotation, targetAngle, rotationLerpWeight)
	
func fire_weapon() -> void:
	weapon.fire_at_angle(rotation_degrees)

func _on_sub_acknowledged(username:String) -> void:
	print_debug('in on sub ack')
	%SubThanks.text = "Thanks for the sub, %s!" % username
	%SubThanks.show()
	await get_tree().create_timer(2).timeout
	%SubThanks.hide()

#func push_back(hitbox:HitboxComponent) -> void:
	#get_angle_to(hitbox.global_position)
