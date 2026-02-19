class_name StreamManager
extends Node

const DEFAULT_SUB_GOAL = 500

var views:int
var subs:int
var subGoal:int
var _nextSubQueued := false

func _init(startingViews:int = 0, startingSubs:int = 0, startingSubGoal:int = DEFAULT_SUB_GOAL) -> void:
	views = startingViews
	subs = startingSubs
	subGoal = startingSubGoal
	EventHub.subAcknowledged.connect(func(_username): update_views(1))
	EventHub.subAcknowledged.connect(queue_next_sub.unbind(1))
	EventHub.subIgnored.connect(func(_username): update_views(-1))
	EventHub.subIgnored.connect(queue_next_sub.unbind(1))
	EventHub.actorDestroyed.connect(maybe_increase_viewers)
	
func new_sub() -> void:
	var username = ["saintspaints", "_f3_reeder", "MomsPaghetti"].pick_random()
	var subLength = randi_range(1, 100)
	subs += 1
	EventHub.newSub.emit(username, subLength)
	
func calculate_time_until_next_sub_alert() -> float:
	return 2.2

func queue_next_sub() -> void:
	if _nextSubQueued: return
	_nextSubQueued = true
	await get_tree().create_timer(calculate_time_until_next_sub_alert()).timeout
	_nextSubQueued = false
	if views == 0:
		call_deferred("queue_next_sub")
	else:
		new_sub()

func maybe_increase_viewers(actor:Node2D) -> void:
	if actor is HostCharacter: return
	if actor.dropsComponent == null: return
	update_views(actor.dropsComponent.calculate_views_reward())
	
func update_views(amount:int) -> void:
	views += amount
	EventHub.newViewers.emit(amount, views)
