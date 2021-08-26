extends Node2D

var player_turn := false
var selected_character: Area2D = null
var player_char_count: int

onready var map: Node2D = $Map
onready var characters: Node2D = $Characters/YSort

func _ready() -> void:
	player_char_count = characters.get_children().size()
	for c in characters.get_children():
		c.connect("selected", self, "_on_Character_selected")
		c.connect("unselected", self, "_on_Character_unselected")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			if selected_character:
				print("click character ", selected_character.get_instance_id())
				map.move_character(selected_character)

func _on_Character_selected(charc: Area2D) -> void:
	if selected_character:
		selected_character.unselect()
	selected_character = charc
	map.character_selected(charc)

func _on_Character_unselected() -> void:
	selected_character = null

func _on_Map_move_char(pos: Vector2):
	print("char move to ", pos)
	selected_character.position = pos

