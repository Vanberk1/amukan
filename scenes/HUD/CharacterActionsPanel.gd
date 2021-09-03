extends Control

signal action_pressed(action)

onready var actions := [
	$CenterContainer/HBoxContainer/ActionBtn0,
	$CenterContainer/HBoxContainer/ActionBtn1,
	$CenterContainer/HBoxContainer/ActionBtn2,
	$CenterContainer/HBoxContainer/ActionBtn3
]

