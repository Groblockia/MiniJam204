extends Node

@onready var base_npc = preload("res://characters/npcs/npc_test.tscn")

var player
var order_point
var spawn_point
var leave_point

var wait_line: Array
var can_spawn := false

var is_ordering := false
#current order counters
var glass: int
var food: int


func _ready():
	pass

## starts the whole game logic
func start_game():
	can_spawn = true
	npc_spawn_timer()

func npc_spawn_timer():
	if can_spawn == true:
		var client_spawn_timer = Timer.new()
		add_child(client_spawn_timer)
		client_spawn_timer.wait_time = randf_range(5,15)
		client_spawn_timer.timeout.connect(_on_client_spawn_timer_timeout)
		client_spawn_timer.one_shot = true
		client_spawn_timer.start()
		print("timer time = ", client_spawn_timer.wait_time)

func _on_client_spawn_timer_timeout():
	print("client spawned")
	var x = base_npc.instantiate()
	wait_line.append(x)
	add_child(x)
	x.global_transform.origin = spawn_point.position
	x.set_target_position(order_point.position)

func start_ordering():
	glass = randi_range(1,3)
	food = randi_range(1,3)
	is_ordering = true
