extends Area2D

signal selected
signal unselected

# Si mov_range es igual a -1 el personaje no puede moverse
export var mov_range := -1

var selected := false
var can_move := true

onready var animation := $AnimatedSprite
onready var collision := $CollisionShape2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			print("character input")

func _input_event(_viewport: Object, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			if !selected:
				print("char click ", get_instance_id())
				select()

func select() -> void:
#	print("select ", get_instance_id())
	selected = true
	animation.frame = 1
	emit_signal("selected", self)

func unselect() -> void:
#	print("unselect ", get_instance_id())
	animation.frame = 0
	selected = false
	emit_signal("unselected")

