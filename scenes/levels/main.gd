extends Node3D

func _ready() -> void:
	GameManager.order_point = $NpcPositionMarkers/Ordering
	GameManager.spawn_point = $NpcPositionMarkers/Spawning
	GameManager.leave_point = $NpcPositionMarkers/Leaving
