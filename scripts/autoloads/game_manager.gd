extends Node

enum InputScheme {
	KBM,
	Gamepad
}

enum CollisionLayer {
	None = 0,
	Player = 1 << 0,
	Enemy = 1 << 1,
	Obstacle = 1 << 2
}

var inputScheme:InputScheme = InputScheme.KBM
var hostCharacter:HostCharacter

var streamManager:StreamManager

func _input(event: InputEvent) -> void:
	if event is InputEventMouse: return
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		inputScheme = InputScheme.Gamepad
	elif inputScheme != InputScheme.KBM:
		inputScheme = InputScheme.KBM

func start_new_stream() -> void:
	streamManager = StreamManager.new()
