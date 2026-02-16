class_name ChatMessageBox
extends MarginContainer

var _message:ChatMessage
@onready var visibleOnScreenNotifier := $VisibleOnScreenNotifier2D as VisibleOnScreenNotifier2D

func _ready() -> void:
	visibleOnScreenNotifier.screen_exited.connect(queue_free)

func setup(message:ChatMessage) -> void:
	_message = message
	update_display()
	
func update_display() -> void:
	var messageString = "[img=25]%s[/img] [color=%s]%s[/color]: %s" % [_message.icon.resource_path, _message.usernameColor.to_html(false), _message.username, _message.message]
	%Message.text = messageString
