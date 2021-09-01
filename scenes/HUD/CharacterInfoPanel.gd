extends Control

onready var name_label := $VBoxContainer/CharacterNameLabel
onready var str_label := $VBoxContainer/StrLabel
onready var vit_label := $VBoxContainer/VitLabel
onready var int_label := $VBoxContainer/IntLabel
onready var dex_label := $VBoxContainer/DexLabel

func set_character_info(char_name: String, char_stats: Resource):
	name_label.text = "Name: " + char_name
	str_label.text = "str: " + str(char_stats.strength)
	vit_label.text = "vit: " + str(char_stats.vitality)
	int_label.text = "int: " + str(char_stats.intelligence)
	dex_label.text = "dex: " + str(char_stats.dexterity)
