extends Node3D

@onready var glass = preload("res://assets/glass/glass.tscn")
@onready var container = $GlassContainer

var glasses: Array
var quantity:int = 0

func _ready() -> void:
	for i in $GlassContainer.get_children():
		glasses.append(i)
	position_glasses()

func _process(_delta: float) -> void:
	quantity = glasses.size()
	if quantity >= 6: remove_glass(1)
	print(quantity)
	
	if Input.is_action_just_pressed("ui_up"):
		add_glass(2)
	if Input.is_action_just_pressed("ui_down"):
		remove_glass(2)

func remove_glass(x: int):
	if quantity <= 0: return
	for i in range(glasses.size()-1, -1, -1):
		glasses[i].queue_free()
		glasses.pop_at(i)
		x -= 1
		if x <= 0:
			return

func add_glass(x: int):
	if quantity >= 5: return
	for i in x:
		var scene = glass.instantiate()
		container.add_child(scene)
		glasses.append(scene)
		if quantity >= 5: return
	position_glasses()

func position_glasses():
	for i in glasses.size():
		glasses[i].position = Vector3(0.55 - (0.15*i), 0.2 + (0.06*i), 0.0)
		glasses[i].rotation.z = deg_to_rad(62.3)
