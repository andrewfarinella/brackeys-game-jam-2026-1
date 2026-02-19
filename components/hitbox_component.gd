class_name HitboxComponent
extends Area2D

@export var damage = 1.0

signal hit_hurtbox(hurtbox)

func _ready():
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: Node):
	if not hurtbox is HurtboxComponent: return
	if hurtbox.is_invincible: return
	hurtbox.hurt.emit(self)
	hit_hurtbox.emit(hurtbox)
