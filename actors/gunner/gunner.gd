extends Node2D
@onready var hurtboxComponent: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var weapon:Weapon = $Weapon as Weapon
@onready var moveComponent: MoveComponent = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtboxComponent.hurt.connect(queue_free.unbind(1))
	fire_weapon()

func fire_weapon() -> void:
	await get_tree().create_timer(randf_range(0.9, 1.2)).timeout
	var startingRotation := rotation_degrees
	look_at(GameManager.hostCharacter.global_position)
	rotate(deg_to_rad(90))
	var endingRotation := rotation_degrees
	moveComponent.velocity = moveComponent.velocity.rotated(deg_to_rad(endingRotation - startingRotation))
	
	weapon.fire_at_angle(rotation_degrees)
	#var bullet = spawnerComponent.spawn(global_position, %Projectiles) as Bullet
	#bullet.look_at(GameManager.hostCharacter.global_position)
	#bullet.rotate(deg_to_rad(90))
	#bullet.target_player()
	fire_weapon()
	pass
