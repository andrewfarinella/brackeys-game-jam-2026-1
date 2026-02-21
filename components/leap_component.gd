class_name LeapComponent
extends Node

@export var actor:Node2D
@export var moveInputComponent:MoveInputComponent
@export var leapDelay:int = 4
@export var leapDuration:float = .5
@export var speedMultiplier:int = 4

func _ready() -> void:
	start_leap_timer()
	
func start_leap_timer() -> void:
	await get_tree().create_timer(leapDelay).timeout
	await leap()
	call_deferred("start_leap_timer")
	
func leap() -> void:
	moveInputComponent.moveStats.speed = moveInputComponent.moveStats.speed * speedMultiplier
	moveInputComponent.overrideDirection = moveInputComponent.get_calculated_direction()
	moveInputComponent.use_override_direction(true)
	await get_tree().create_timer(leapDuration).timeout
	moveInputComponent.moveStats.speed = moveInputComponent.moveStats.speed / speedMultiplier
	moveInputComponent.use_override_direction(false)
