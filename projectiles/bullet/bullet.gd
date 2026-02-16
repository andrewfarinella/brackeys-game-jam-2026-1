class_name Bullet
extends Node2D

@onready var visibleOnScreenNotifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitboxComponent: HitboxComponent = $HitboxComponent as HitboxComponent

func _ready() -> void:
	visibleOnScreenNotifier.screen_exited.connect(queue_free)
	hitboxComponent.hit_hurtbox.connect(queue_free.unbind(1))
