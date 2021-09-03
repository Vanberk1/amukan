extends Node2D

var selected_character: Area2D = null

onready var map := $Map
onready var characters := $Characters/YSort 
onready var HUD := $HUD

func _ready():
	map.set_tiles(characters.get_children())

func _input(event: InputEvent) -> void:
	# mover a Nodo superior
	if event.is_action_pressed("ui_cancel"):
		get_tree().free()

func _on_Cursor_left_click(pos: Vector2) -> void:
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(pos, 1, [], 0x7FFFFFFF, true, true)
	if result:
		if selected_character:
			selected_character.unselect()
			map.clear_movement()
		selected_character = result[0].collider
		selected_character.select()
		HUD.show_character_info(selected_character)
		map.entity_selected(selected_character)
	else:
		if selected_character:
			if map.check_movement(pos):
				var new_pos = map.move_character(selected_character.position, pos)
				selected_character.position = new_pos
			else:
				HUD.hide_character_info()
				selected_character.unselect()
				map.clear_movement()
