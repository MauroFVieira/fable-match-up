extends Node2D

var isOpen: bool = false
var type: int

func _ready():
	$RichTextLabel.text = str(type)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if $Back.get_rect().has_point(to_local(event.position)):
			if !isOpen:
				if get_parent().try_start_flipping(type):
					reveal()

func turn_back():
	if isOpen:
		isOpen = false
		$Back/AnimationPlayer.play("turn_back")

func reveal():
	if !isOpen:
		isOpen = true
		$Back/AnimationPlayer.play("dissolve")

func get_size():
	return $Face.texture.get_size() * scale.x

func on_card_flipped():
	get_parent().on_card_flipped()
