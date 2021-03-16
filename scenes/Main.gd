extends Node2D

onready var hint : Node2D = $Hint
onready var tilemap : TileMap = $TileMap 

func _ready() -> void:
	pass

func _input(event) -> void:
	pass

func _process(delta) -> void:
	var mouse_pos : Vector2 = get_global_mouse_position()
	mouse_pos.y += 8 
	var tile_pos = tilemap.world_to_map(mouse_pos)
	var cell = tilemap.get_cellv(tile_pos)
#	print("cell: ", cell)
#	if Input.is_mouse_button_pressed(1):
#	print("mouse_pos: ", mouse_pos)
#	print("tile_pos: ", tile_pos)
	hint.global_position = tilemap.map_to_world(tile_pos)
	

func car_to_iso(pos : Vector2) -> Vector2:
	return Vector2(pos.x + pos.y, 0.5 * (pos.y - pos.x))

func iso_to_car(pos : Vector2) -> Vector2:
	return Vector2(0.5 * (pos.x - pos.y), pos.y + pos.x)
