extends Node2D

var subCount := 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_sub_message()
	
func increase_sub_count() -> void:
	subCount += 1
	%SubCount.text = "Sub Goal: %d/1,000,000" % subCount
	
func show_sub_message() -> void:
	await get_tree().create_timer(randf_range(0.2, 3.5)).timeout
	var color = Color(randf(), randf(), randf()).to_html(false)
	var username = ["saintspaints", "_f3_reeder", "MomsPaghetti"].pick_random()
	var subLength = randi_range(1, 100)
	%SubMessage.text = "[color=%s]%s[/color] subscribed for %d months!" % [color, username, subLength]
	%SubMessage.show()
	increase_sub_count()
	await get_tree().create_timer(3).timeout
	%SubMessage.hide()
	show_sub_message()
