extends Control

const MESSAGE_COUNT_VARIANCE = 2

@export var messages:Array[ChatMessage]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_chat_messages()

func init_chat_messages() -> void:
	for child:Node in %ChatMessages.get_children():
		%ChatMessages.remove_child(child)
		child.call_deferred("queue_free")
		
func begin_chat() -> void:
	add_chat_messages()

func add_chat_messages() -> void:
	var messageCountBase = max(1, ceili(GameManager.streamManager.views / 1000.))
	var messageCount = randi_range(max(0, messageCountBase - MESSAGE_COUNT_VARIANCE), messageCountBase + MESSAGE_COUNT_VARIANCE)
	await get_tree().create_timer(randf_range(max(0, 15/messageCountBase - 0.5), 15/messageCountBase + 0.5)).timeout
	if GameManager.streamManager.views == 0:
		call_deferred("add_chat_messages")
		return
	
	for i in messageCount:
		var message = messages.pick_random()
		var container := load("uid://d1f6rqws6ggdu").instantiate().duplicate() as ChatMessageBox
		container.setup(message)
		%ChatMessages.add_child(container)
		
	await get_tree().process_frame
	%ScrollContainer.scroll_vertical = int(%ScrollContainer.get_v_scroll_bar().max_value)
	call_deferred("add_chat_messages")
