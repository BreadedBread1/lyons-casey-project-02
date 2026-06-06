extends CharacterBody2D
class_name PlayerBody2d

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var  SPEED : int = 200
var  JUMP_VELOCITY : int = -300

var coins : int = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			animated_sprite_2d.flip_h = true
		if direction > 0:
			animated_sprite_2d.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
