## Autoload that manages all interaction calls
extends Node

## send interaction call to object
func interact(collided: Object)-> void:
	if collided is Interactable:
		if collided.has_method("interacted"):
			collided.interacted()

## activates hovered logic on object
func hover_on(collided: Object) -> void:
	collided.hover_on()

## deactivates hovered logic on object
func hover_off(collided: Object)-> void:
	collided.hover_off()
