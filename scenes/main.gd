extends Node2D
@onready var chatbox: Control = $CanvasLayer/Chatbox

func _ready() -> void:
	GameManager.start_new_stream()
	add_child(GameManager.streamManager)
	update_viewer_count(0, GameManager.streamManager.views)
	EventHub.newViewers.connect(update_viewer_count)
	EventHub.subAcknowledged.connect(show_sub_message.unbind(1))
	EventHub.subIgnored.connect(show_sub_message.unbind(1))
	EventHub.newSub.connect(show_sub_message)
	chatbox.call_deferred("begin_chat")
	GameManager.streamManager.call_deferred("queue_next_sub")
	
func update_viewer_count(_newViewers:int, totalViewers:int) -> void:
	%ViewCount.text = "%s viewers" % GameUtils.format_number(totalViewers)
	
func increase_sub_count(subCount:int, subGoal:int) -> void:
	subCount += 1
	%SubCount.text = "Sub Goal: %d/%s" % [subCount, GameUtils.format_number(subGoal)]
	
func show_sub_message(username:String, duration:int) -> void:
	%GameScreen.display_sub_alert(username, duration)
