extends Control

onready var name_label := $VBoxContainer/CharacterNameLabel
onready var str_label := $VBoxContainer/StrLabel
onready var hp_label := $VBoxContainer/HPLabel
onready var sp_label := $VBoxContainer/SPLabel
onready var vit_label := $VBoxContainer/VitLabel
onready var int_label := $VBoxContainer/IntLabel
onready var dex_label := $VBoxContainer/DexLabel

func set_character_info(char_name: String, char_stats: Resource):
	name_label.text = "Name: " + char_name
	hp_label.text = "HP: " + str(char_stats.health) + "/" + str(char_stats.max_health)
	sp_label.text = "SP: " + str(char_stats.soul) + "/" + str(char_stats.max_soul)
	str_label.text = "str: " + str(char_stats.strength)
	vit_label.text = "vit: " + str(char_stats.vitality)
	int_label.text = "int: " + str(char_stats.intelligence)
	dex_label.text = "dex: " + str(char_stats.dexterity)
