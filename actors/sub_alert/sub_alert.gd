class_name SubAlert
extends Node2D

@onready var hurtboxComponent: HurtboxComponent = $HurtboxComponent
@onready var statsComponent: StatsComponent = $StatsComponent

var _username:String
var _duration:int

var lastCameraPosition:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	statsComponent.healthExhausted.connect(acknowledge)
	
func _process(_delta: float) -> void:
	translate(GameManager.hostCharacter.camera.global_position - lastCameraPosition)
	lastCameraPosition = GameManager.hostCharacter.camera.global_position
	pass
	
func setup(username:String, duration:int, parent:Node, positionOffset:Vector2) -> void:
	var camera = GameManager.hostCharacter.camera
	_username = username
	_duration = duration
	parent.add_child(self)
	global_position = camera.get_screen_center_position() - (Vector2(get_viewport().size) / 2) + positionOffset
	lastCameraPosition = camera.global_position
	
func display_alert() -> void:
	var color = Color(randf(), randf(), randf()).to_html(false)
	%Message.text = "[color=%s]%s[/color] subscribed for %d months!" % [color, _username, _duration]
	show()
	await get_tree().create_timer(3).timeout
	ignore()
	
func acknowledge() -> void:
	print_debug('in ack')
	EventHub.subAcknowledged.emit(_username)
	queue_free()
	
func ignore() -> void:
	EventHub.subIgnored.emit(_username)
	queue_free()
