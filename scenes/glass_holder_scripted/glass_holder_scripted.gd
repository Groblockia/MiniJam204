extends Node3D

var glasses: Array

func _ready() -> void:
	for i in $GlassContainer.get_children():
		glasses.append(i)
	print(glasses)
	
	for i in glasses.size():
		glasses[i].position = Vector3(0.55 - (0.15*i), 0.2 + (0.06*i), 0.0)
		glasses[i].rotation.z = 62.3
