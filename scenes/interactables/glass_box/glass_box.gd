extends Interactable

var picked_up := false

func _ready() -> void:
	GameManager.respawn_glass_box.connect(respawn)

func interacted() -> void:
	picked_up = true
	if picked_up:
		hide()
		GameManager.pick_up_glass_box()

func _process(_delta: float) -> void:
	if picked_up:
		visible = false
		$CollisionShape3D.disabled = true
	else:
		visible = true
		$CollisionShape3D.disabled = false

func respawn():
	picked_up = false
