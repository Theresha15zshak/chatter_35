extends Control
onready var labellose = $VBoxContainer/LabelLose
func _ready():
	labellose.text = "{0}".format([get_node("..").get_lose_text()])


func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_pressed():
	get_tree().reload_current_scene()
