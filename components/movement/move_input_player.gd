class_name MoveInputPlayerComponent
extends MoveInputComponent

#var isSprinting := false
#
#func _input(_event: InputEvent) -> void:
	#var xAxis = Input.get_axis("Left", "Right")
	#var yAxis = Input.get_axis("Up", "Down")
	#
	#isSprinting = Input.is_action_pressed("Sprint")
	#var speed = moveStats.sprintSpeed if isSprinting else moveStats.speed
	#moveComponent.velocity = Vector2(xAxis * speed, yAxis * speed)

func get_calculated_direction() -> Vector2:
	return Input.get_vector("Left", "Right", "Up", "Down")
