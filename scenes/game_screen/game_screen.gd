class_name GameScreen
extends Node2D

var subAlert = preload("uid://xvx2qtalrh0w")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.hostCharacter = $Host
	EventHub.weaponFired.connect(_on_weapon_fired)
	
func _on_weapon_fired(bullet:Bullet) -> void:
	%Projectiles.add_child(bullet)

func display_sub_alert(username:String, duration:int) -> void:
	var newAlert:SubAlert = subAlert.instantiate().duplicate() as SubAlert
	newAlert.setup(username, duration, self, %SubAlertMarker.position)
	newAlert.display_alert()
	
