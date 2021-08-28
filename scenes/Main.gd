extends Node2D

var selected_character: Area2D = null

onready var map: Node2D = $Map

func _on_Cursor_left_click(pos: Vector2) -> void:
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
			var new_pos = map.move_character(selected_character.position, pos)
			if new_pos != Vector2.ZERO:
				selected_character.position = new_pos
