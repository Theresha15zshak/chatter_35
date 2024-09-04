extends Control

const MENU_SCENE = "res://scenes/controlmenu.tscn"
onready var text_label:Label = $VBoxContainer/LabelWin
var max_level_id = len(Global.levels_data)


func set_text(text):
	if !(text is String):
		return
	text_label.text = text
func _on_button_menu_pressed():
	get_tree().change_scene(MENU_SCENE)

func _on_button_countinue_pressed():
	if Global.current_level == max_level_id:
		return _on_button_menu_pressed()
	Global.current_level += 1
	get_tree().reload_current_scene()
