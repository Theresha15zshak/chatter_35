extends Control

func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_pressed():
	get_tree().reload_current_scene()
