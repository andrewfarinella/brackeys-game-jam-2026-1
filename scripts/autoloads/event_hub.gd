extends Node

#region COMBAT
signal spawnEnemyAtPosition(scene:PackedScene, position:Vector2)

signal weaponFired(bullet:Bullet)
signal actorDestroyed(actor:Node2D)
#endregion

#region STREAM
signal newViewers(newViewers:int, totalViewers:int)
signal newSub(username:String, duration:int)

signal subAcknowledged(username:String)
signal subIgnored(username:String)
#endregion
