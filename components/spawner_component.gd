class_name SpawnerComponent
extends Node2D

@export var scene:PackedScene

func spawn(scene:PackedScene, globalSpawnPosition: Vector2 = global_position) -> void:
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	#EventHub.weaponFired.emit(scene, globalSpawnPosition)
