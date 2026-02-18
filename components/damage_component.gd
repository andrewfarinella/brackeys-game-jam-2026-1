class_name DamageComponent
extends Node

@export var hurtboxComponent:HurtboxComponent
@export var statsComponent:StatsComponent

signal damageTaken(hitbox:HitboxComponent)

func _ready() -> void:
	hurtboxComponent.hurt.connect(take_damage)

func take_damage(hitbox:HitboxComponent) -> void:
	statsComponent.take_damage()
	damageTaken.emit(hitbox)
