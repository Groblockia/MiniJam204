extends Node

@onready var screamer_test = preload("res://scenes/events/screamer_test.tscn")

func spawn_screamer_test(pos: Vector3):
	var scene = screamer_test.instantiate()
	get_tree().get_root().add_child(scene)
	scene.global_position = pos
