class_name StatusEffectComponent
extends Node

@export var actor:Node2D
@export var effects:Array[StatusEffect]

func add_effect(effect:StatusEffect) -> void:
	if effects.has(effect): return
	
	effects.append(effect)
	effect.set_actor(actor)
	
func remove_effect(effect:StatusEffect) -> void:
	if !effects.has(effect): return
	effects.remove_at(effects.find(effect))
