class_name Milbug
extends Node2D
@onready var dropsComponent: DropsComponent = $DropsComponent

func _physics_process(delta: float) -> void:
	rotation = lerp_angle(rotation, rotation + get_angle_to(GameManager.hostCharacter.global_position), delta * 1.5)
	
