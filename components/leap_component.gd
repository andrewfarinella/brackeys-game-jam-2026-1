class_name LeapComponent
extends Node

@export var moveInputComponent:MoveInputComponent
@export var leapDelay:int = 4
@export var leapDuration:int = 2
@export var speedMultiplier:int = 3

func _ready() -> void:
	start_leap_timer()
	
func start_leap_timer() -> void:
	await get_tree().create_timer(leapDelay).timeout
	await leap()
	call_deferred("start_leap_timer")
	
func leap() -> void:
	moveInputComponent.moveStats.speed = moveInputComponent.moveStats.speed * speedMultiplier
	await get_tree().create_timer(leapDuration).timeout
	moveInputComponent.moveStats.speed = moveInputComponent.moveStats.speed / speedMultiplier
