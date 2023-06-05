extends Node2D

var scoreA = 0
var scoreB = 0

func _draw():
	draw_line(Vector2(10, 152), Vector2(60, 152), Color.GREEN, 4)
	draw_line(Vector2(70, 152), Vector2(120, 152), Color.RED, 4)
	draw_rect(Rect2(10, 150 - (10 * scoreA), 50, 10 * scoreA), Color.GREEN)
	draw_rect(Rect2(70, 150 - (10 * scoreB), 50, 10 * scoreB), Color.RED)
