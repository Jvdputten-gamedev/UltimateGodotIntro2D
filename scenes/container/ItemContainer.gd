extends StaticBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

var opened = false
signal open(pos, direction)

func hit():
	print('object')
