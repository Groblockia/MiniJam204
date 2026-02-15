extends Control

@onready var slider = $PanelContainer/HBoxContainer/VBoxContainer/HBoxContainer/HSlider
@onready var label = $PanelContainer/HBoxContainer/VBoxContainer/HBoxContainer/Label

func _ready() -> void:
	slider.value = 0

func _process(delta: float) -> void:
	label.text = "%d" % slider.value
	#print((slider.value) / 1000)

func _on_start_button_pressed() -> void:
	#GameManager.mouse_sensibility = slider.value / 1000
	GameManager.launch_main_scene()
	GameManager.start_game()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
