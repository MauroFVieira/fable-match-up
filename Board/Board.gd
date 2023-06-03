extends Node2D

@onready var card = preload("res://Card/Card.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 6):
		for j in range(0, 4):
			var card_instance = card.instantiate()
			var size = card_instance.get_size()
			card_instance.position = Vector2(i * (size.x * 1.1), j * (size.y * 1.1))
			add_child(card_instance)
