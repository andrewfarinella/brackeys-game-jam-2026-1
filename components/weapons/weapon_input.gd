class_name WeaponInputComponent
extends Node

@export var weaponCooldown := 0.05
var canFire := true

signal weaponFired

func _process(_delta: float) -> void:
		if Input.is_action_pressed("Fire") and canFire:
			fire_weapon()
			
func fire_weapon() -> void:
	weaponFired.emit()
	canFire = false
	await get_tree().create_timer(weaponCooldown).timeout
	canFire = true
