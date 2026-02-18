class_name StatsComponent
extends Node

@export var startingHealth:int = 1
@export var startingDefense:int = 0
var currentHealth:int = 0

signal healthChanged()
signal healthExhausted()

func _ready() -> void:
	currentHealth = startingHealth
	
func take_damage(amount:int = 1) -> void:
	currentHealth -= amount
	healthChanged.emit()
	if currentHealth <= 0:
		healthExhausted.emit()
	
