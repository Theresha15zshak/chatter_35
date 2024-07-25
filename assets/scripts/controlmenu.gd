extends Control

func _process(delta: float) -> void:
	for i in range(2, Global.levels_unlocked + 1):
		get_node("TextureButton" + str(i) + "/TextureRect").hide()
		get_node("TextureButton" + str(i)).disabled = false

func on_level_button_pressed(level_id: int):
	if Global.levels_unlocked < level_id:
		return
	get_tree().change_scene("res://scenes/chats/dialog" + str(level_id) + ".tscn")
