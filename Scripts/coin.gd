extends Area2D

var player : PlayerBody2d
@export var speed_boost_value : int = 300
@onready var speed_buff_timer: Timer = $SpeedBuffTimer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coin_sound: AudioStreamPlayer = $AudioStreamPlayer
@onready var game_manager: GameManager = %"GameManager"


func _on_body_entered(body: Node2D) -> void:
	player = body as PlayerBody2d
	player.SPEED = speed_boost_value
	coin_sound.play()
	game_manager.add_points(1)
	collision_shape_2d.set_deferred("disabled", true)
	animated_sprite_2d.visible = false
	speed_buff_timer.start()


func _on_speed_buff_timer_timeout() -> void:
	player.SPEED = 200
	queue_free()
