extends Control
onready var labelwin = $VBoxContainer/LabelWin
func _ready():
	labelwin.text = "{0}".format([get_node("..").get_win_text()])

func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_countinue_pressed():
	var level = get_node("..").get_next_level()
	get_tree().change_scene(level)
