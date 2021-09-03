extends Area2D

class_name Unit

# Si mov_range es igual a -1 el personaje no puede moverse
export(String) var unit_name
export var mov_range := -1
export(Dictionary) var init_stats := {
	"max_hp": 0,
	"max_sp": 0,
	"str": 0,
	"vit": 0,
	"int": 0,
	"dex": 0
}

var stats: Stats

var selected := false
var can_move := true

onready var animation := $AnimatedSprite
onready var collision := $CollisionShape2D

func _ready() -> void:
	stats = Stats.new()
	stats.set_stats(init_stats)

func select() -> void:
#	print("select ", get_instance_id())
	selected = true
	animation.frame = 1

func unselect() -> void:
#	print("unselect ", get_instance_id())
	selected = false
	animation.frame = 0
