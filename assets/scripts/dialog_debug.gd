extends Control

var text = preload("res://scenes/uielements/dialog3/controltext.tscn")
onready var Scroller := $MarginContainer/VBoxContainer/ScrollContainer

func scroll():
	var SC = Scroller as ScrollContainer
	SC.set_v_scroll(SC.get_v_scroll() + 100)
	print("Scroll_", "   ",SC.get_instance_id())
	
func _on_Button_pressed():
	var a_text = text.instance()
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(a_text)
	yield(get_tree().create_timer(0.1), "timeout")
	scroll()
	
