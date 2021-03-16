extends Node2D

onready var hint : Node2D = $Hint
onready var tilemap : TileMap = $TileMap 

func _ready() -> void:
	pass

func _process(_delta : float) -> void:
	var mouse_pos : Vector2 = get_global_mouse_position()
	mouse_pos.y += 8 
	var tile_pos = tilemap.world_to_map(mouse_pos)
	var cell = tilemap.get_cell(tile_pos.x - 11, tile_pos.y - 1)
	if Input.is_action_just_pressed("left_click"):
		print("tile_pos: ", tile_pos)
		print("cell: ", cell)
	
	if cell != -1:
		hint.show()
		hint.global_position = tilemap.map_to_world(tile_pos)
	else:
		hint.hide()
	

func car_to_iso(pos : Vector2) -> Vector2:
	return Vector2(pos.x + pos.y, 0.5 * (pos.y - pos.x))

func iso_to_car(pos : Vector2) -> Vector2:
	return Vector2(0.5 * (pos.x - pos.y), pos.y + pos.x)
