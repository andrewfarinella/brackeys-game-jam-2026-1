@abstract
class_name StatusEffect
extends Resource

@export var name:String
@warning_ignore("unused_private_class_variable")
var _actor:Node2D

@abstract
func set_actor(actor:Node2D) -> void
