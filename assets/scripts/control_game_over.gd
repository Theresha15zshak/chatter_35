extends Control

func _on_button_menu_pressed():
	Global.js_show_ad()
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_pressed():
	Global.js_show_ad()
	get_tree().reload_current_scene()
