class_name WeaponBase
extends Weapon

func _ready() -> void:
	%Timer.wait_time = max((60 / fireRate) / 60, .1)

func fire_at_angle(rotationDegrees:float) -> void:
	if !canFire: return
	var instance = bullet.instantiate() as Bullet
	instance.target(target)
	instance.global_position = global_position
	instance.rotation_degrees = rotationDegrees

	EventHub.weaponFired.emit(instance)
	%AudioStreamPlayer.pitch_scale = randi_range(1.75, 2.5)
	%AudioStreamPlayer.play()
	
	canFire = false
	%Timer.start()
	await %Timer.timeout
	canFire = true
