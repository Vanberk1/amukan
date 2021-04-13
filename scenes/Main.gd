extends Node2D

var selected_character : Area2D = null
var player_turn := false
var player_char_count : int

onready var hint : Node2D = $Hint
onready var tilemap : TileMap = $TileMap 
onready var characters : Node2D = $Characters

func _ready() -> void:
	player_char_count = characters.get_children().size()
	for c in characters.get_children():
		c.connect("selected", self, "_on_Character_selected")
		c.connect("released", self, "_on_Character_released")

func _process(_delta : float) -> void:
	var mouse_pos : Vector2 = get_global_mouse_position()
	mouse_pos.y += 8 
	var tile_pos = tilemap.world_to_map(mouse_pos)
	var cell = tilemap.get_cell(tile_pos.x - 11, tile_pos.y - 1)
#	if Input.is_action_just_pressed("left_click"):
#		print("tile_pos: ", tile_pos)
#		print("cell: ", cell)
#		if cell != -1:
#			character.global_position = tilemap.map_to_world(tile_pos)
	if cell != -1:
		hint.show()
		hint.global_position = tilemap.map_to_world(tile_pos)
	else:
		hint.hide()
	
func car_to_iso(pos : Vector2) -> Vector2:
	return Vector2(pos.x + pos.y, 0.5 * (pos.y - pos.x))

func iso_to_car(pos : Vector2) -> Vector2:
	return Vector2(0.5 * (pos.x - pos.y), pos.y + pos.x)

func _on_Character_released(charc, pos) -> void:
	var tile_pos := tilemap.world_to_map(pos)
	var cell = tilemap.get_cell(tile_pos.x - 11, tile_pos.y - 1)
	var char_pos := tilemap.map_to_world(tile_pos)
	if cell != -1:
		charc.global_position = Vector2(char_pos.x, char_pos.y + 12)
	else:
		charc.return_initial_pos()

func _on_Character_selected(charc) -> void:
	if selected_character:
		selected_character.unselect()
	selected_character = charc
	selected_character.select()
	
