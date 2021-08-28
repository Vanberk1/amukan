extends Node2D

var player_turn := false
var selected_character: Area2D = null
var player_char_count: int

onready var map: Node2D = $Map
onready var characters: Node2D = $Characters/YSort

func _ready() -> void:
	player_char_count = characters.get_children().size()
#	for c in characters.get_children():
#		c.connect("selected", self, "_on_Character_selected")
#		c.connect("unselected", self, "_on_Character_unselected")

func _on_Character_unselected() -> void:
	selected_character = null

func _on_Map_move_char(pos: Vector2) -> void:
	print("char move to ", pos)
	selected_character.position = pos

func _on_Cursor_left_click(pos) -> void:
	print("left click ", pos)
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(pos, 1, [], 0x7FFFFFFF, true, true)
	if result:
		if selected_character:
			selected_character.unselect()
			map.clear_movement()
		selected_character = result[0].collider
		selected_character.select()
		map.character_selected(selected_character)
	else:
		if selected_character:
			map.move_character(selected_character, pos)
