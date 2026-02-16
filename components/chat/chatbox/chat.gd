extends Control

@export var messages:Array[ChatMessage]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_chat_messages()
	add_chat_messages()

func init_chat_messages() -> void:
	for child:Node in %ChatMessages.get_children():
		%ChatMessages.remove_child(child)
		child.call_deferred("queue_free")
		
	for message:ChatMessage in messages:
		var container := load("uid://d1f6rqws6ggdu").instantiate().duplicate() as ChatMessageBox
		container.setup(message)
		%ChatMessages.add_child(container)

func add_chat_messages() -> void:
	var messageCount = randi() % 2 + 1
	
	for i in messageCount:
		var message = messages.pick_random()
		var container := load("uid://d1f6rqws6ggdu").instantiate().duplicate() as ChatMessageBox
		container.setup(message)
		%ChatMessages.add_child(container)
		
	await get_tree().process_frame
	%ScrollContainer.scroll_vertical = int(%ScrollContainer.get_v_scroll_bar().max_value)
	await get_tree().create_timer(randf_range(0.1, .6)).timeout
	add_chat_messages()
