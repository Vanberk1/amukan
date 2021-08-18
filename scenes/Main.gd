extends Node2D

var player_turn := false
var selected_character: Area2D = null
var player_char_count: int

onready var map: Node2D = $Map
onready var characters: Node2D = $Characters

func _ready() -> void:
	player_char_count = characters.get_children().size()
	for c in characters.get_children():
		c.connect("selected", self, "_on_Character_selected")
		c.connect("unselected", self, "_on_Character_unselected")

func car_to_iso(pos : Vector2) -> Vector2:
	return Vector2(pos.x + pos.y, 0.5 * (pos.y - pos.x))

func iso_to_car(pos : Vector2) -> Vector2:
	return Vector2(0.5 * (pos.x - pos.y), pos.y + pos.x)

func _on_Character_selected(charc: Area2D) -> void:
	selected_character = charc
	map.character_selected(charc)

func _on_Character_unselected() -> void:
	selected_character = null
	map.character_unselected()

