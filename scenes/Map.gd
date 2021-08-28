extends Node2D

signal move_char

var selected_char: Area2D = null

onready var terrain: TileMap = $Terrain
onready var movement: TileMap = $Movement
onready var hint: Node2D = $Hint

func _ready():
	hint.hide()

func _process(_delta : float) -> void:
	var mouse_pos: Vector2 = get_local_mouse_position()
	var tile_pos = terrain.world_to_map(mouse_pos)
	var cell = terrain.get_cellv(tile_pos)
	if cell != -1:
		hint.show()
		hint.position = terrain.map_to_world(tile_pos)
	else:
		hint.hide()

func move_character(charc: Area2D, pos: Vector2) -> void:
	if charc:
		print("map move character")
		var tile_pos := movement.world_to_map(pos)
		var cell := movement.get_cellv(tile_pos)
		var char_pos := terrain.world_to_map(charc.position - position)
#		print(tile_pos, " ", cell, " ", char_pos)
		if cell != -1 && tile_pos != char_pos:
			emit_signal("move_char", movement.map_to_world(tile_pos) + position + Vector2(0, 2))
		else:
			character_unselected()
		clear_movement()

func character_selected(charc: Area2D) -> void:
	selected_char = charc
	var char_pos := terrain.world_to_map(selected_char.position - position)
	show_character_move_range(char_pos, charc.mov_range)

func character_unselected() -> void:
	selected_char.unselect()
	selected_char = null

func show_character_move_range(pos: Vector2, ran: int) -> void:
	if ran != -1:
		for x in range(-ran, ran + 1):
			for y in range(-ran, ran + 1):
				var terrain_cell = terrain.get_cellv(pos + Vector2(x, y))
				if terrain_cell != -1:
					if abs(x) + abs(y) <= ran:
						movement.set_cellv(pos + Vector2(x, y), 1)

func clear_movement():
	movement.clear()






