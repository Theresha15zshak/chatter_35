extends Control

const MENU_SCENE = "res://scenes/controlmenu.tscn"
onready var menu_button:Button = $VBoxContainer/Button2
onready var continue_label:Label = $VBoxContainer/Button/Label
var max_level_id = len(Global.levels_data)

func _ready():
	if Global.current_level != max_level_id:
		return
	menu_button.hide()
	continue_label.text = "В меню"

func _on_button_menu_pressed():
	get_tree().change_scene(MENU_SCENE)

func _on_button_countinue_pressed():
	if Global.current_level == max_level_id:
		return _on_button_menu_pressed()
	Global.current_level += 1
	get_tree().reload_current_scene()
