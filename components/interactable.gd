class_name Interactable extends Node3D 

@export var displayName: String

## do whatever needs to be done when interacted
func interacted() -> void:
	print("don't forget to override the interacted() function")

func hover_on():
	print("don't forget to override the hover_on() function")

func hover_off():
	print("don't forget to override the hover_off() function")
