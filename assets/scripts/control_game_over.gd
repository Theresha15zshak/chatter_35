extends Control

func _ready():
	pass
func _on_button_menu_pressed():
	var chance = randf() 

	Global.js_show_ad()
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_pressed():
	Global.js_show_ad()
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().reload_current_scene()
