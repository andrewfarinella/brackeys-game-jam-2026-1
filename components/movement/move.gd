class_name MoveComponent
extends Node

@export var actor:CollisionObject2D
@export var velocity:Vector2
@export var ignoreRotation:=false
@export var moveInputComponent:MoveInputComponent
var _canMove := true

func _physics_process(delta: float) -> void:
	if !_canMove: return
	var direction = moveInputComponent.get_direction()
	if actor is CharacterBody2D:
		actor.velocity = direction * moveInputComponent.moveStats.speed
		actor.move_and_slide()
	elif actor is Area2D:
		actor.translate(direction * moveInputComponent.moveStats.speed * delta)

func actor_can_move(canMove:bool) -> void:
	_canMove = canMove
