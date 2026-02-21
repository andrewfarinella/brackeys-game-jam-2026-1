class_name MainScene
extends Node2D

func _ready() -> void:
	%StartButton.pressed.connect(start_game)
	%SettingsButton.pressed.connect(load_settings)
	%ExitButton.pressed.connect(exit)
	
func start_game() -> void:
	get_tree().change_scene_to_file("uid://wg4bybau6yty")
	
func load_settings() -> void:
	pass
	
func exit() -> void:
	get_tree().quit()
