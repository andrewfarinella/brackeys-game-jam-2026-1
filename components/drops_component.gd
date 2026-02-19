class_name DropsComponent
extends Node

@export var viewsRewardBase:int = 10
@export var viewsRewardVariance:int = 2

func calculate_views_reward() -> int:
	return randi_range(viewsRewardBase - viewsRewardVariance, viewsRewardBase + viewsRewardVariance)
