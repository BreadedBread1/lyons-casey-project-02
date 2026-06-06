extends Area2D


var player : PlayerBody2d

func _on_body_entered(body: Node2D) -> void:
	player = body as PlayerBody2d
	player.JUMP_VELOCITY = -365
	queue_free()
