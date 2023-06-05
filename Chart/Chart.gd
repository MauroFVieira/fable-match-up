extends Node2D

var scoreA = 1
var scoreB = 1

func _draw():
	draw_rect(Rect2(10, 150 - (10 * scoreA), 50, 10 * scoreA), Color.GREEN)
	draw_rect(Rect2(70, 150 - (10 * scoreB), 50, 10 * scoreB), Color.RED)
