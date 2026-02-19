class_name SplitComponent
extends Node2D

@export var statsComponent:StatsComponent
@export var parts:Array[PackedScene]
@export var markers:Array[Marker2D]

func _ready() -> void:
	statsComponent.healthExhausted.connect(split)
	
func split() -> void:
	for i in parts.size():
		var part = parts[i]
		var marker = markers[i]
		EventHub.spawnEnemyAtPosition.emit(part, marker.global_position)
