extends Node2D

@onready var card = preload("res://Card/Card.tscn")

var cardTypes = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12]
var flippingCards = 0
var currentType = -1
var finishedFlippingCount = 0
var matched = false

var currentPlayer = 1
var scores = [-1, 0, 0]

func _ready():
	$Chart.position = Vector2(700, 300)
	cardTypes.shuffle()
	for i in range(0, 6):
		for j in range(0, 4):
			var card_instance = card.instantiate()
			var size = card_instance.get_size()
			card_instance.position = Vector2(i * (size.x * 1.1), j * (size.y * 1.1))
			card_instance.type = cardTypes[(j * 6) + i]
			$Cards.add_child(card_instance)

func try_start_flipping(type: int):
	if flippingCards > 1:
		return false
	if currentType == -1:
		currentType = type
	elif currentType == type:
		matched = true
	flippingCards += 1
	return true

func on_card_flipped():
	finishedFlippingCount += 1
	if finishedFlippingCount == 2:
		finishedFlippingCount = 0
		flippingCards = 0
		currentType = -1
		if matched:
			scores[currentPlayer] += 1 
			matched = false
			for child in $Cards.get_children():
				if child.isOpen:
					child.queue_free()
					$Cards.remove_child(child)
		else:
			currentPlayer = 3 - currentPlayer
			queue_redraw()
			for child in $Cards.get_children():
				if child.isOpen:
					child.turn_back()
		$Chart.scoreA = scores[1]
		$Chart.scoreB = scores[2]
		$Chart.queue_redraw()
		print("current: %s, score1: %s, score2: %s" % [currentPlayer, scores[1], scores[2]])

func _draw():
	if currentPlayer == 1:
		draw_circle(Vector2(600, 100), 20, Color.GREEN)
	else:
		draw_circle(Vector2(600, 100), 20, Color.RED)
