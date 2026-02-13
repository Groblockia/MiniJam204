class_name Interactable extends Node3D 

@export var displayName: String

## do whatever needs to be done when interacted
func interacted() -> void:
	print("don't forget to override the interacted() function")
