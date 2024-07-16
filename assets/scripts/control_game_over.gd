extends Control
#onready var labellose = $VBoxContainer/LabelLose
func _ready():
	var chance = randi() % 100+1
	var chance_need = 55
	if chance <= chance_need:
		Global.js_show_ad()


func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_pressed():
	get_tree().reload_current_scene()
