class_name MoveInputComponent
extends Node

@export var moveComponent: MoveComponent
@export var moveStats: MovementStats

func _input(_event: InputEvent) -> void:
	var xAxis = Input.get_axis("ui_left", "ui_right")
	var yAxis = Input.get_axis("ui_up", "ui_down")
	moveComponent.velocity = Vector2(xAxis * moveStats.speed, yAxis * moveStats.speed)
