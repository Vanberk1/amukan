extends Area2D

# Si mov_range es igual a -1 el personaje no puede moverse
export(String) var character_name
export var mov_range := -1
export(Dictionary) var init_stats := {
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

func set_stats(new_stats: Dictionary):
	stats.strength = new_stats["str"]
	stats.vitality = new_stats["vit"]
	stats.intelligence = new_stats["int"]
	stats.deterity = new_stats["dex"]
