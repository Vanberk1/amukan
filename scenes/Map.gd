extends Node2D

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

func move_character(char_pos: Vector2, pos: Vector2) -> Vector2:
	print("map move character ", pos)
	var tile_pos := movement.world_to_map(pos - position)
	var cell := movement.get_cellv(tile_pos)
	var char_tile := terrain.world_to_map(char_pos - position)
	print(tile_pos, " ", cell, " ", char_tile)
	clear_movement()
	if cell != -1 && tile_pos != char_tile:
		return movement.map_to_world(tile_pos) + position + Vector2(0, 2)
	return Vector2.ZERO

func character_selected(charc: Area2D) -> void:
	var char_pos := terrain.world_to_map(charc.position - position)
	show_character_move_range(char_pos, charc.mov_range)

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






