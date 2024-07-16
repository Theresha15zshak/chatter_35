extends Control
#onready var labelwin = $VBoxContainer/LabelWin
func _ready():
	var chance = randi() % 100+1
	var chance_need = 55
	if chance <= chance_need:
		Global.js_show_ad()

func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_countinue_pressed():
	var level = get_node("..").get_next_level()
	get_tree().change_scene(level)
