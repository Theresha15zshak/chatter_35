extends Control

func _ready():
	var unlocked_levels:Array = Global.unlocked_levels
	if Global.is_debug_enabled():
		unlocked_levels = []
		for i in range(1, Global.levels_data.size() + 1):
			unlocked_levels.append(i)
	
	for i in unlocked_levels:
		var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
		if !has_node(rect_node_path):
			continue
		get_node(rect_node_path).hide()
		get_node("TextureButton" + str(i)).disabled = false

func on_level_button_pressed(level_id: int):
	Global.current_level = level_id
	get_tree().change_scene("res://scenes/chat.tscn")
