class_name SubAlert
extends Node2D

@onready var hurtboxComponent: HurtboxComponent = $HurtboxComponent

var _username:String
var _duration:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtboxComponent.hurt.connect(acknowledge.unbind(1))

func setup(username:String, duration:int) -> void:
	_username = username
	_duration = duration
	
func display_alert() -> void:
	var color = Color(randf(), randf(), randf()).to_html(false)
	%Message.text = "[color=%s]%s[/color] subscribed for %d months!" % [color, _username, _duration]
	show()
	await get_tree().create_timer(3).timeout
	ignore()
	
func acknowledge() -> void:
	EventHub.subAcknowledged.emit(_username)
	queue_free()
	
func ignore() -> void:
	EventHub.subIgnored.emit(_username)
	queue_free()
