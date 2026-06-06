extends Node2D


@export var speed : float = 30
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var enemy_sprite: AnimatedSprite2D = $AnimatedSprite2D

var facing_left : bool = true

func _physics_process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		facing_left = false
		enemy_sprite.flip_h = true
	
	if ray_cast_right.is_colliding():
		facing_left = true
		enemy_sprite.flip_h = false
	
	
	if facing_left:
		position.x += -speed * delta
	else:
		position.x += speed * delta
