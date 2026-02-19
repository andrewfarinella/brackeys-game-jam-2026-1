class_name StatusEffectParalyze
extends StatusEffect

@export var timerDuration:int = 1
var statusEffectComponent:StatusEffectComponent
var moveComponent:MoveComponent

func set_actor(actor:Node2D) -> void:
	_actor = actor
	for child in _actor.get_children():
		if child is MoveComponent:
			moveComponent = child
		elif child is StatusEffectComponent:
			statusEffectComponent = child
	
	if moveComponent and statusEffectComponent:
		start_paralyze_timer()
		return

func start_paralyze_timer() -> void:
	if moveComponent == null: return
	moveComponent.actor_can_move(false)
	await _actor.get_tree().create_timer(timerDuration).timeout
	moveComponent.actor_can_move(true)
	remove_self()
	
func remove_self() -> void:
	statusEffectComponent.remove_effect(self)
