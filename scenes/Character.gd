extends Area2D

# Si mov_range es igual a -1 el personaje no puede moverse
export var mov_range := -1

var selected := false
var can_move := true

onready var animation := $AnimatedSprite
onready var collision := $CollisionShape2D

func select() -> void:
#	print("select ", get_instance_id())
	selected = true
	animation.frame = 1

func unselect() -> void:
#	print("unselect ", get_instance_id())
	animation.frame = 0
	selected = false

