extends Node2D

signal left_click(pos)

onready var sprite := $AnimatedSprite

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		emit_signal("left_click", position)

func _process(delta):
	position = get_global_mouse_position()

