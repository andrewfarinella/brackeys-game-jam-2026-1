class_name BulletHoming  
extends Bullet

@export var bulletDuration:int = 3

func _ready() -> void:
	super._ready()
	start_bullet_duration_timer()
	
func start_bullet_duration_timer() -> void:
	%Timer.start(bulletDuration)
	await %Timer.timeout
	call_deferred("queue_free")
	
