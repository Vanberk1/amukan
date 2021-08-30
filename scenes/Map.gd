extends Node2D

var filled_tiles := {}
var ents_pos := {}

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

func set_tiles(entities: Array) -> void:
	for ent in entities:
		var ent_tile := terrain.world_to_map(ent.position - position)
		update_tile(ent_tile, ent.get_instance_id())

func update_tile(ent_tile: Vector2, ent_id: int):
	if ents_pos.has(ent_id):
		filled_tiles.erase(ents_pos[ent_id])
	filled_tiles[ent_tile] = ent_id
	ents_pos[ent_id] = ent_tile

func check_movement(new_pos: Vector2) -> bool:
	var tile_pos := movement.world_to_map(new_pos - position)
	var cell := movement.get_cellv(tile_pos)
	if cell == 1:
		return true
	return false

func move_character(ent_pos: Vector2, new_pos: Vector2) -> Vector2:
	print("map move character ", new_pos)
	var ent_tile := terrain.world_to_map(ent_pos - position)
	var new_tile := terrain.world_to_map(new_pos - position)
	print(new_tile)
	clear_movement()
	update_tile(new_tile, filled_tiles[ent_tile])
	return movement.map_to_world(new_tile) + position + Vector2(0, 2)

func entity_selected(entity: Area2D) -> void:
	var ent_pos := terrain.world_to_map(entity.position - position)
	show_entity_move_range(ent_pos, entity.mov_range)

func show_entity_move_range(pos: Vector2, ran: int) -> void:
	print(filled_tiles)
	if ran != -1:
		for x in range(-ran, ran + 1):
			for y in range(-ran, ran + 1):
				if abs(x) + abs(y) <= ran:
					var new_pos = pos + Vector2(x, y)
					var terrain_cell = terrain.get_cellv(new_pos)
					if terrain_cell != -1 && !filled_tiles.has(new_pos):
						movement.set_cellv(new_pos, 1)

func clear_movement():
	movement.clear()






