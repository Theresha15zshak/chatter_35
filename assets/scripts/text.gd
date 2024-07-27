class_name Message
extends Control

onready var label:Label = $HBoxContainer/MarginContainer/Control/Panel/Label
onready var icon:TextureRect = $HBoxContainer/TextureRect

func set_text(text: String):
	label.text = text

func set_icon(texture: Texture):
	icon.texture = texture
