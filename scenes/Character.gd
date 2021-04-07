extends Area2D

var picked : bool = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if !picked:
			picked = true
			print("picked")
		else:
			picked = false
			print("released")

func _process(delta):
	if picked:
		global_position = get_global_mouse_position()
