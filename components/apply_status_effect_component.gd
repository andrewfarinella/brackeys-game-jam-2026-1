class_name ApplyStatusEffectComponent
extends Node

@export var statusEffect:StatusEffect
@export var hitboxComponent:HitboxComponent

func _ready() -> void:
	hitboxComponent.hit_hurtbox.connect(apply_effect)
	
func apply_effect(hurtbox:HurtboxComponent) -> void:
	for child in hurtbox.owner.get_children():
		if child is StatusEffectComponent:
			(child as StatusEffectComponent).add_effect(statusEffect)
