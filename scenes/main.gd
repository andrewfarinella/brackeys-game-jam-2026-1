extends Node2D

var subCount := 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventHub.subAcknowledged.connect(show_sub_message.unbind(1))
	EventHub.subIgnored.connect(show_sub_message.unbind(1))
	show_sub_message()
	
func increase_sub_count() -> void:
	subCount += 1
	%SubCount.text = "Sub Goal: %d/1,000,000" % subCount
	
func show_sub_message() -> void:
	await get_tree().create_timer(randf_range(0.2, 3.5)).timeout
	var username = ["saintspaints", "_f3_reeder", "MomsPaghetti"].pick_random()
	var subLength = randi_range(1, 100)
	increase_sub_count()
	%GameScreen.display_sub_alert(username, subLength)
