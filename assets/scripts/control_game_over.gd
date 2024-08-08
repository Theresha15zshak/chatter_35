extends Control
const DialogData = preload("res://assets/scripts/dialog_data.gd")

onready var label = $VBoxContainer/LabelLose

func _ready():
	pass
func set_text(text):
	if !(text is String):
		return
	label.text = text

func _on_button_menu_pressed():
	YandexSDK.show_ad()
	get_tree().change_scene("res://scenes/controlmenu.tscn")


func _on_button_pressed():
	YandexSDK.show_ad()
	get_tree().reload_current_scene()
