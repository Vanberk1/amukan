extends Area2D

signal selected
signal released(charc, pos)

var picked : bool = false
var select : bool = false
var initial_pos := Vector2.ZERO

onready var animation := $AnimatedSprite

func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton:
		if !picked:
			picked = true
			initial_pos = global_position
			emit_signal("selected", self)
			print("picked")
		else:
			picked = false
			emit_signal("released", self, global_position)
			print("released")

func _process(_delta) -> void:
	if picked:
		global_position = get_global_mouse_position()

func return_initial_pos() -> void:
	global_position = initial_pos

func unselect() -> void:
	select = false
	animation.frame = 0

func select() -> void:
	select = true
	animation.frame = 1
