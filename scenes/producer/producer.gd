extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%ButtonPanel.go_live_button.pressed.connect(go_live)
	
func go_live() -> void:
	get_tree().change_scene_to_file("uid://dayu8cafucbx4")
