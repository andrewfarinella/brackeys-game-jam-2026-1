class_name DamageComponent
extends Node

@export var hurtboxComponent:HurtboxComponent
@export var statsComponent:StatsComponent

signal damageTaken(amount:int)

func _ready() -> void:
	hurtboxComponent.hurt.connect(take_damage_from_hitbox)

func take_damage_from_hitbox(hitbox:HitboxComponent) -> void:
	take_damage(1)
	
func take_damage(amount:int) -> void:
	statsComponent.take_damage(amount)
	damageTaken.emit(amount)
