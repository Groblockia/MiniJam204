extends Interactable

@onready var donut = preload("res://assets/3d/Donuts/donuts.tscn")
@onready var container = $DonutContainer

var donuts: Array
var quantity: int

func _ready() -> void:
	for i in $DonutContainer.get_children():
		donuts.append(i)
	position_donuts()
	#print(donuts)

func _process(_delta: float) -> void:
	quantity = donuts.size()
	if quantity >= 9: remove_donut(1)
	#print(quantity)
	
	if Input.is_action_just_pressed("ui_up"):
		add_donut(1)
	if Input.is_action_just_pressed("ui_down"):
		remove_donut(1)


func interacted() -> void:
	print("caca")
	if GameManager.food > 0:
		GameManager.food -= 1
		remove_donut(1)
	if GameManager.player.food_box_in_hand == true:
		add_donut(8 - quantity)
		GameManager.player.hide_food_box()
		GameManager.respawn_food_box.emit()




func remove_donut(x:int):
	if quantity <= 0: return
	for i in range(donuts.size()-1, -1, -1):
		donuts[i].queue_free()
		donuts.pop_at(i)
		x -= 1
		if x <= 0:
			return

func add_donut(x:int):
	if quantity >= 8: return
	for i in x:
		var scene = donut.instantiate()
		scene.scale = Vector3(2,2,2)
		container.add_child(scene)
		donuts.append(scene)
		if quantity >= 8: return
	position_donuts()

func position_donuts():
	for i in donuts.size():
		if i == 0:
			donuts[i].position = Vector3(-0.25, 0.5, -0.35)
		if i == 1:
			donuts[i].position = Vector3(0.25, 0.5, -0.35)
		if i == 2:
			donuts[i].position = Vector3(0.25, 0.5, 0.0)
		if i == 3:
			donuts[i].position = Vector3(-0.25, 0.5, 0.0)
		if i == 4:
			donuts[i].position = Vector3(-0.25, -0.25, -0.184)
		if i == 5:
			donuts[i].position = Vector3(0.25, -0.25, -0.184)
		if i == 6:
			donuts[i].position = Vector3(0.25, -0.25, 0.166)
		if i == 7:
			donuts[i].position = Vector3(-0.25, -0.25, 0.166)
