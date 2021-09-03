extends CanvasLayer

onready var character_panel := $GUI/CharacterPanel

func _ready() -> void:
	character_panel.hide()

func show_character_info(character: Area2D) -> void:
	var info_panel = character_panel.get_node("CharacterInfoPanel")
	var actions_panel = character_panel.get_node("CharacterActionsPanel")
	info_panel.set_character_info(character.unit_name, character.stats)
#	actions_panel.set_character_actions(character.actions)
	character_panel.show()

func hide_character_info() -> void:
	character_panel.hide()
