extends Node2D

var isOpen: bool = false
var type: int


func _ready():
	$RichTextLabel.text = str(type)


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if $Back.get_rect().has_point(to_local(event.position)):
			flip()


func flip():
	if isOpen:
		$Back/AnimationPlayer.play_backwards("dissolve")
	else:
		$Back/AnimationPlayer.play("dissolve")
	isOpen = !isOpen


func get_size():
	return $Face.texture.get_size() * scale.x
