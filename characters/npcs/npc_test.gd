extends CharacterBody3D

const SPEED := 5.0
var direction: Vector3

var order_satisfied: bool = false

@onready var navAgent = $NavigationAgent3D

func _ready():
	GameManager.order_finished.connect(leave)

func _process(delta: float) -> void:
	#gravity
	velocity.y -= 9.8 * delta
	move_and_slide()
	
	rotation.y = atan2(direction.x,direction.z)
	
	if navAgent.distance_to_target()>1:
		move_to_target(delta)
	else:
		velocity = Vector3(0, velocity.y, 0)
	
	#if velocity != Vector3.ZERO:
		#%AnimationPlayer.play("walking")
	#else:
		#%AnimationPlayer.play("RESET")

func move_to_target(delta:float) -> void:
	var current_pos = global_position
	var next_pos = navAgent.get_next_path_position()
	direction = (next_pos - current_pos).normalized()
	velocity = direction * SPEED
	velocity.y -= 9.8 * delta

func set_target_position(pos: Vector3):
	navAgent.target_position = pos

func leave():
	order_satisfied = true
	set_target_position(GameManager.leave_point.position)

func _on_navigation_agent_3d_target_reached() -> void:
	if order_satisfied:
		GameManager.npc_spawn_timer()
		queue_free()
	else:
		GameManager._start_ordering()
