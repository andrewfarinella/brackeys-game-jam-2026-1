extends Node

enum InputScheme {
	KBM,
	Gamepad
}

var inputScheme:InputScheme = InputScheme.KBM
var hostCharacter:HostCharacter

func _input(event: InputEvent) -> void:
	if event is InputEventMouse: return
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		inputScheme = InputScheme.Gamepad
	elif inputScheme != InputScheme.KBM:
		inputScheme = InputScheme.KBM
