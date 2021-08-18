extends Area2D

signal selected
signal unselected

# Si mov_range es igual a -1 el personaje no puede moverse
export var mov_range := -1

var selected := false
var initial_pos := Vector2.ZERO

onready var animation := $AnimatedSprite

func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			if !selected:
				select()
			else:
				unselect()

func return_to_initial_pos() -> void:
	global_position = initial_pos

func select() -> void:
	initial_pos = global_position
	selected = true
	animation.frame = 1
	emit_signal("selected", self)

func unselect() -> void:
	initial_pos = Vector2.ZERO
	selected = false
	animation.frame = 0
	emit_signal("unselected")

