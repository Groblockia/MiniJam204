extends Node

@onready var base_npc = preload("res://characters/npcs/npc_test.tscn")

signal enter_screen(pos, rot)
signal leave_screen
signal order_finished

var player
var order_point
var spawn_point
var leave_point

var wait_line: Array
var can_spawn := true
var client_counter:int = 0
var is_finished: bool = false

var is_ordering := false
#current order counters
var coffee: int
var food: int


func _ready():
	pass

func _process(_delta: float) -> void:
	if client_counter > 2:
		is_finished = true

## starts the whole game logic
func start_game():
	can_spawn = true
	npc_spawn_timer()

func npc_spawn_timer():
	if can_spawn == true && is_finished == false:
		can_spawn = false
		var client_spawn_timer = Timer.new()
		add_child(client_spawn_timer)
		client_spawn_timer.wait_time = randf_range(5,15)
		client_spawn_timer.timeout.connect(_on_client_spawn_timer_timeout)
		client_spawn_timer.one_shot = true
		client_spawn_timer.start()
		print("timer time = ", client_spawn_timer.wait_time)

func _on_client_spawn_timer_timeout():
	var x = base_npc.instantiate()
	wait_line.append(x)
	client_counter += 1
	add_child(x)
	x.global_transform.origin = spawn_point.position
	x.set_target_position(order_point.position)
	npc_spawn_timer()

func _start_ordering():
	print("start ordering")
	coffee = randi_range(1,3)
	food = randi_range(0,0)
	is_ordering = true

func _is_order_finished():
	if coffee == 0 && food == 0:
		order_finished.emit()
		is_ordering = false
		can_spawn = true

func enter_register_screen():
	enter_screen.emit()

func leave_register_screen():
	leave_screen.emit()
