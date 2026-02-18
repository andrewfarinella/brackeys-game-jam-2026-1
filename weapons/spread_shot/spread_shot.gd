class_name WeaponSpreadShot
extends Weapon

func fire_at_angle(rotationDegrees:float) -> void:
	if !canFire: return
	for angleOffset in [-8, 0, 8]:
		var instance = bullet.instantiate() as Bullet
		instance.target(target)
		instance.global_position = global_position
		instance.rotation_degrees = rotationDegrees + angleOffset

		EventHub.weaponFired.emit(instance)
	
	canFire = false
	await get_tree().create_timer(fireRate/60).timeout
	canFire = true
