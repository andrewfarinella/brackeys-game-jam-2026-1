class_name DestroyedComponent
extends Node

@export var actor:Node2D
@export var statsComponent:StatsComponent

func _ready() -> void:
	statsComponent.healthExhausted.connect(destroyed)
	
func destroyed() -> void:
	EventHub.actorDestroyed.emit(actor)
	actor.queue_free()
