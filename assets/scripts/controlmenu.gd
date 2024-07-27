extends Control

func _process(delta: float) -> void:
	for i in Global.unlocked_levels:
		var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
		if !has_node(rect_node_path):
			continue
		get_node(rect_node_path).hide()
		get_node("TextureButton" + str(i)).disabled = false

func on_level_button_pressed(level_id: int):
	if !Global.unlocked_levels.has(level_id):
		return
	Global.current_level = level_id
	get_tree().change_scene("res://scenes/chat.tscn")
