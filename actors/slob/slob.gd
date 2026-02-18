extends Node2D
@onready var hurtboxComponent: HurtboxComponent = $HurtboxComponent as HurtboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtboxComponent.hurt.connect(queue_free.unbind(1))

func _process(delta: float) -> void:
	if GameManager.hostCharacter:
		look_at(GameManager.hostCharacter.global_position)
		rotate(deg_to_rad(-90))
