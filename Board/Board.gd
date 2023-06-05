extends Node2D

@onready var card = preload("res://Card/Card.tscn")

var cardTypes = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12]

# Called when the node enters the scene tree for the first time.
func _ready():
	cardTypes.shuffle()
	for i in range(0, 6):
		for j in range(0, 4):
			var card_instance = card.instantiate()
			var size = card_instance.get_size()
			card_instance.position = Vector2(i * (size.x * 1.1), j * (size.y * 1.1))
			card_instance.type = cardTypes[(j * 6) + i]
			add_child(card_instance)
