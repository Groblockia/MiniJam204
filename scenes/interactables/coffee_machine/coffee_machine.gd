extends Interactable

func interacted() -> void:
	if GameManager.coffee > 0:
		GameManager.coffee -= 1
