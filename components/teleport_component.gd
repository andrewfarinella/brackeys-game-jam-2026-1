class_name TeleportComponent
extends Area2D

@export var actor:Node2D
@export var actorCollisionShape:CollisionShape2D
@export var teleportDelay:int = 5
var visibilityNotifier:VisibleOnScreenNotifier2D

func _ready() -> void:
	start_teleport_timer()
	visibilityNotifier = VisibleOnScreenNotifier2D.new()
	add_child(visibilityNotifier)
	
func start_teleport_timer() -> void:
	await get_tree().create_timer(teleportDelay).timeout
	check_if_body_in_teleport_target()

func check_if_body_in_teleport_target() -> void:
	if !visibilityNotifier.is_on_screen():
		call_deferred("start_teleport_timer")
		return
	var shape = shape_owner_get_shape(0, 0) as CircleShape2D
	var radius = shape.radius
	var actorPosition = actor.global_position
	while true:
		var angle = randf()
		var distance = randi_range(radius / 3, radius)
		
		var viewportRect = get_viewport_rect()
		var camera = GameManager.hostCharacter.camera
		var cameraPosition = camera.get_screen_center_position()
		
		var teleportPosition = actorPosition + Vector2(distance, 0).rotated(deg_to_rad(angle))
		
		if teleportPosition.x < (cameraPosition.x - viewportRect.size.x / 2) \
		or teleportPosition.x > (cameraPosition.x + viewportRect.size.x / 2) \
		or teleportPosition.y < (cameraPosition.y - viewportRect.size.y / 2) \
		or teleportPosition.y > (cameraPosition.y + viewportRect.size.y / 2):
			continue
		
		var testArea = Area2D.new()
		testArea.add_child(actorCollisionShape.duplicate(true))
		var bodyFound = false
		add_child(testArea)
		testArea.body_entered.connect(func():
			print_debug("BODY ENTERED")
			bodyFound = true
		)
		testArea.global_position = teleportPosition
		if bodyFound == false:
			actor.global_position = testArea.global_position
			testArea.queue_free()
			call_deferred("start_teleport_timer")
			return
	
	
