extends CharacterBody3D
class_name Player

@export var DEFAULT_SPEED: float = 5.0

@onready var head = %Head
@onready var player_can_move := true
@onready var aim_raycast = %Raycast

var input_dir
var direction

func _ready() -> void:
	GameManager.player = self

func _process(_delta: float) -> void:
	show_interact_prompt()

func _physics_process(delta: float) -> void:
	# movement code
	if player_can_move:
		input_dir = (Input.get_vector("left", "right", "forward", "backward"))
		direction = ( (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
			.rotated(Vector3.UP, head.rotation.y) )
		
		velocity.x = lerp(velocity.x, direction.x * DEFAULT_SPEED, delta * 10)
		velocity.z = lerp(velocity.z, direction.z * DEFAULT_SPEED, delta * 10)
		
		velocity.y -= 9.8 * delta
		move_and_slide()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_mouse"):
		toggle_mouse()
	if Input.is_action_just_pressed("interact"):
		send_interact()

func toggle_mouse() -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		player_can_move = false
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		player_can_move = true

func send_interact():
	var col = aim_raycast.get_collider()
	if col != null:
		InteractionManager.interact(col)
	else:
		pass

func show_interact_prompt():
	var col = aim_raycast.get_collider()
	if col is Interactable && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		%InteractLabel.text = col.displayName
		%InteractLabel.position = %Camera.unproject_position(col.position)
		%InteractLabel.show()
	else:
		%InteractLabel.hide()
