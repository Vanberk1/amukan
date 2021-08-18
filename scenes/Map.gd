extends Node2D

onready var terrain: TileMap = $Terrain
onready var movement: TileMap = $Movement
onready var hint: Node2D = $Hint

func _ready():
	hint.hide()

func _input(event : InputEvent) -> void:
	var mouse_pos : Vector2 = get_local_mouse_position()
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			var tile_pos = terrain.world_to_map(mouse_pos)
			var cell = terrain.get_cellv(tile_pos)
			print("click ", mouse_pos, " ", tile_pos, " ", cell)

func _process(_delta : float) -> void:
	var mouse_pos: Vector2 = get_local_mouse_position()
	var tile_pos = terrain.world_to_map(mouse_pos)
	var cell = terrain.get_cellv(tile_pos)
	if cell != -1:
		hint.show()
		hint.position = terrain.map_to_world(tile_pos)
	else:
		hint.hide()

func character_selected(charc: Area2D) -> void:
	var char_pos := terrain.world_to_map(charc.position - position)
	show_character_move_range(char_pos, charc.mov_range)

func character_unselected() -> void:
	movement.clear()

func show_character_move_range(pos: Vector2, ran: int) -> void:
	if ran != -1:
		for x in range(-ran, ran + 1):
			for y in range(-ran, ran + 1):
				var terrain_cell = terrain.get_cellv(pos + Vector2(x, y))
				if terrain_cell != -1:
					if abs(x) + abs(y) <= ran:
						movement.set_cellv(pos + Vector2(x, y), 1)









