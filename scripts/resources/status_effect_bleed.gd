class_name StatusEffectBleed
extends StatusEffect

@export var damagePerSecond:int = 1
@export var damageCycleDuration:int = 1
@export var totalDuration:int = 5
var damageComponent:DamageComponent
var statusEffectComponent:StatusEffectComponent
var _cyclesRun:int = 0

func set_actor(actor:Node2D) -> void:
	_actor = actor
	for child in _actor.get_children():
		if child is DamageComponent:
			damageComponent = child
		elif child is StatusEffectComponent:
			statusEffectComponent = child
			
	if damageComponent and statusEffectComponent:
		start_bleed_timer()

func start_bleed_timer() -> void:
	if damageComponent == null: return
	await _actor.get_tree().create_timer(damageCycleDuration).timeout
	damageComponent.take_damage(damagePerSecond)
	_cyclesRun += 1
	if _cyclesRun > totalDuration:
		remove_self()
	call_deferred("start_bleed_timer")
	
func remove_self() -> void:
	statusEffectComponent.remove_effect(self)
	call_deferred("queue_free")
