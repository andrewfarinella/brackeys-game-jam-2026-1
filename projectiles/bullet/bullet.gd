class_name Bullet
extends Node2D

@onready var visibleOnScreenNotifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	visibleOnScreenNotifier.screen_exited.connect(queue_free)
	%HitboxComponent.hit_hurtbox.connect(queue_free.unbind(1))

func target(mask:GameManager.CollisionLayer) -> void:
	%HitboxComponent.collision_mask = mask

func target_player() -> void:
	%HitboxComponent.collision_mask = 1

func target_enemies() -> void:
	%HitboxComponent.collision_mask = 2
