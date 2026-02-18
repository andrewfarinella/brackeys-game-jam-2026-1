class_name MoveComponent
extends Node

@export var actor:CollisionObject2D
@export var velocity:Vector2
@export var ignoreRotation:=false
@export var moveInputComponent:MoveInputComponent

func _physics_process(delta: float) -> void:
	var direction = moveInputComponent.get_direction()
	if actor is CharacterBody2D:
		actor.velocity = direction * moveInputComponent.moveStats.speed
		actor.move_and_slide()
	elif actor is Area2D:
		actor.translate(direction * moveInputComponent.moveStats.speed * delta)
