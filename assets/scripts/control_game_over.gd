extends Control


func _on_button_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_screen.tscn")


func _on_button_pressed():
	get_tree().reload_current_scene()
