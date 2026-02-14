extends Interactable

func interacted() -> void:
	if $glass_holder_scripted.quantity > 0:
		if GameManager.coffee > 0:
			GameManager.coffee -= 1
			$glass_holder_scripted.remove_glass(1)

	if $glass_holder_scripted.quantity == 0:
		pass
