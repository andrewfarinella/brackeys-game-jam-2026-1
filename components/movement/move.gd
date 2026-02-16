class_name MoveComponent
extends Node

@export var actor:Node2D
@export var velocity:Vector2
@export var ignoreRotation:=false

func _process(delta: float) -> void:
	var rotatedVelocity = velocity if ignoreRotation else velocity.rotated(actor.rotation)
	actor.translate(rotatedVelocity * delta)
