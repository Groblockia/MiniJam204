extends CharacterBody3D

const SPEED := 5.0

@onready var navAgent = $NavigationAgent3D

func _physics_process(delta: float) -> void:
	velocity.y -= 9.8 * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("interact"):
		navAgent.target_position = get_target_location()
		print(navAgent.target_position)
	
	move_to_target()

func move_to_target():
	var current_pos = global_position
	var next_pos = navAgent.get_next_path_position()
	var direction = (next_pos - current_pos).normalized()
	velocity = direction * SPEED

func get_target_location() -> Vector3:
	var offset_x = randf_range(-10, 10) 
	var offset_z = randf_range(-10, 10)
	
	return Vector3(offset_x, 0, offset_z)
