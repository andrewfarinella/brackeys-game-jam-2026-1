class_name PositionClampComponent
extends Node

@export var actor:Node2D
@export var margin := 8

var leftBorder = 0
var rightBorder = 0 # ProjectSettings.get_setting("display/window/size/viewport_width")
var topBorder = 0
var bottomBorder = 0 # ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready() -> void:
	rightBorder = get_viewport().get_visible_rect().size.x
	bottomBorder = get_viewport().get_visible_rect().size.y

func _process(_delta: float) -> void:
	actor.global_position.x = clamp(actor.global_position.x, leftBorder + margin, rightBorder - margin)
	actor.global_position.y = clamp(actor.global_position.y, topBorder + margin, bottomBorder - margin)
