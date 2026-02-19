class_name RadiationComponent
extends Area2D

@export var damagePerSecond:int = 1
var bodyInArea := false
var actor:Node2D

func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	
func on_body_entered(body:Node2D) -> void:
	print_debug("BODY ENTERED RADIATION")
	if bodyInArea: return
	bodyInArea = true
	actor = body
	run_damage_timer()
	
func on_body_exited(_body:Node2D) -> void:
	bodyInArea = false
	
func run_damage_timer() -> void:
	await get_tree().create_timer(1).timeout
	if !bodyInArea: return
	for child in actor.get_children():
		if !child.is_in_group("DamageComponents"): continue
		(child as DamageComponent).take_damage(damagePerSecond)
		run_damage_timer()
		return
