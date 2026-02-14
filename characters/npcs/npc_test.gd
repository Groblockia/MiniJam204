extends CharacterBody3D

const SPEED := 5.0
var direction: Vector3

@onready var navAgent = $NavigationAgent3D

func _process(delta: float) -> void:
	#gravity
	velocity.y -= 9.8 * delta
	move_and_slide()
	
	rotation.y = atan2(direction.x,direction.z)
	
	if navAgent.distance_to_target()>1:
		move_to_target(delta)
	else:
		velocity = Vector3(0, velocity.y, 0)
	
	if velocity != Vector3.ZERO:
		%AnimationPlayer.play("rig|rigAction")
	else:
		%AnimationPlayer.play("RESET")

func move_to_target(delta:float) -> void:
	var current_pos = global_position
	var next_pos = navAgent.get_next_path_position()
	direction = (next_pos - current_pos).normalized()
	velocity = direction * SPEED
	velocity.y -= 9.8 * delta

func set_target_position(pos: Vector3):
	navAgent.target_position = pos

func _on_navigation_agent_3d_navigation_finished() -> void:
	GameManager.start_ordering()
