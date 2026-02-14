extends Control

func _on_button_pressed() -> void:
	GameManager.leave_register_screen()

func _process(_delta: float) -> void:
	%coffee.text = "Coffee cups: %d" % GameManager.coffee
	%food.text = "Food items: %d" % GameManager.food


func _on_finish_pressed() -> void:
	GameManager._is_order_finished()
