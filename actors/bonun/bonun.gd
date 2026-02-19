class_name Bonun
extends Node2D
@onready var hurtboxComponent: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var weapon:Weapon = $Weapon as Weapon
@onready var moveComponent: MoveComponent = $MoveComponent
@onready var dropsComponent: DropsComponent = $DropsComponent
@onready var visibleNotifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtboxComponent.hurt.connect(queue_free.unbind(1))
	fire_weapon()

func fire_weapon() -> void:
	await get_tree().create_timer(weapon.fireRateInSeconds).timeout
	if GameManager.hostCharacter == null: return
	if !visibleNotifier.is_on_screen():
		call_deferred("fire_weapon")
		return
	var startingRotation := rotation_degrees
	look_at(GameManager.hostCharacter.global_position)
	rotate(deg_to_rad(90))
	var endingRotation := rotation_degrees
	moveComponent.velocity = moveComponent.velocity.rotated(deg_to_rad(endingRotation - startingRotation))
	weapon.fire_at_angle(rotation_degrees)
	call_deferred("fire_weapon")
