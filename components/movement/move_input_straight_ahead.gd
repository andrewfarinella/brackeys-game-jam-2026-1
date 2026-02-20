class_name MoveInputStraightAheadComponent
extends MoveInputComponent

func get_calculated_direction() -> Vector2:
	return Vector2.RIGHT.rotated(moveComponent.actor.rotation + deg_to_rad(-90))
