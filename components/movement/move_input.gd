@abstract
class_name MoveInputComponent
extends Node2D

@export var moveComponent: MoveComponent
@export var moveStats: MovementStats
var overrideDirection:Vector2
var useOverrideDirection:bool = false

func use_override_direction(enable:bool) -> void:
	useOverrideDirection = enable
	
@abstract
func get_calculated_direction() -> Vector2

func get_direction() -> Vector2:
	if useOverrideDirection:
		return overrideDirection
	return get_calculated_direction()
