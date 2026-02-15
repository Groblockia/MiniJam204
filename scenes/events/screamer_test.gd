extends Node3D


func _ready() -> void:
	play_music()

func play_music():
	$AudioStreamPlayer3D.play()
