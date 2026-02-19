class_name MoveInputPathFindingComponent
extends MoveInputComponent

#
#var isSprinting := false
#
#func _input(_event: InputEvent) -> void:
	#var xAxis = Input.get_axis("Left", "Right")
	#var yAxis = Input.get_axis("Up", "Down")
	#
	#isSprinting = Input.is_action_pressed("Sprint")
	#var speed = moveStats.sprintSpeed if isSprinting else moveStats.speed
	#moveComponent.velocity = Vector2(xAxis * speed, yAxis * speed)

func get_direction() -> Vector2:
	if GameManager.hostCharacter == null: return Vector2.ZERO
	return global_position.direction_to(GameManager.hostCharacter.global_position)
