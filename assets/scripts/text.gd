extends Control

onready var label = $HBoxContainer/MarginContainer/Control/Panel/Label

func change_text(text):
	label.text = "{0}".format([text]) 
