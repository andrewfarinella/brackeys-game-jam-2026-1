@abstract
class_name Weapon
extends Node2D

@export var target:GameManager.CollisionLayer = GameManager.CollisionLayer.Enemy
## Tracked in bullets per second
@export var fireRate:int = 20
@export var bullet:PackedScene

var canFire := true
var fireRateInSeconds:float:
	get:
		return (60./fireRate)/60.

@abstract
func fire_at_angle(rotationDegrees:float) -> void

func fire() -> void:
	fire_at_angle(rotation_degrees)
