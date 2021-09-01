extends CanvasLayer

onready var character_info_panel := $GUI/CharacterInfoPanel

func _ready() -> void:
	character_info_panel.hide()

func show_character_info(character: Area2D) -> void:
	character_info_panel.show()
	character_info_panel.set_character_info(character.character_name, character.stats)

func hide_character_info() -> void:
	character_info_panel.hide()
