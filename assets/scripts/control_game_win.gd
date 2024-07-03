extends Control

func _on_button_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/controlmenu.tscn")


func _on_button_countinue_pressed():
	var level = get_node("..").get_next_level()
	get_tree().change_scene_to_file(level)
