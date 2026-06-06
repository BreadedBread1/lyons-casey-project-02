extends Node
class_name GameManager

var score : int = 0
@onready var coin_count: Label = %"Coin Count"


func add_points(amount:int) -> void:
	score += amount
	coin_count.text = str(score)
