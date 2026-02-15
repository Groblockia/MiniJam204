extends Node3D

@onready var player = $".."
@onready var camera = %Camera
#var sensi: float

func _ready() -> void:
	var sensi = GameManager.mouse_sensibility
	#print("sensi: " ,sensi)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#func _physics_process(_delta: float) -> void:
	#player.rotation.y = self.rotation.y

func _unhandled_input(event: InputEvent) -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			# rotate the head and camera based on mouse movement
			rotate_y(-event.relative.x * 0.005)
			camera.rotate_x(-event.relative.y * 0.005)
			camera.rotation.x = clamp(camera.rotation.x, -deg_to_rad(60), deg_to_rad(60))
