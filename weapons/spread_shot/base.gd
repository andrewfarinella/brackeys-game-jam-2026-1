class_name WeaponBase
extends Weapon

func fire_at_angle(rotationDegrees:float) -> void:
	if !canFire: return
	var instance = bullet.instantiate() as Bullet
	instance.target(target)
	instance.global_position = global_position
	instance.rotation_degrees = rotationDegrees

	EventHub.weaponFired.emit(instance)
	
	canFire = false
	await get_tree().create_timer(fireRate/60).timeout
	canFire = true
