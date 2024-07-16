extends Control

var dialog1 = "res://scenes/chats/dialog1.tscn"
var dialog2 = "res://scenes/chats/dialog2.tscn"
var dialog3 = "res://scenes/chats/dialog3.tscn"
var dialog4 = "res://scenes/chats/dialog4.tscn"
var dialog5 = "res://scenes/chats/dialog5.tscn"
var dialog6 = "res://scenes/chats/dialog6.tscn"
var dialog7 = "res://scenes/chats/dialog7.tscn"
var dialog8 = "res://scenes/chats/dialog8.tscn"

func _ready():
	Global.js_show_rewarded_ad()

func _process(delta: float) -> void:
	if Global.level1_completed:
		$TextureButton2/TextureRect.hide()
		$TextureButton2.disabled = false
	if Global.level2_completed:
		$TextureButton3/TextureRect.hide()
		$TextureButton3.disabled = false
	if Global.level3_completed:
		$TextureButton4/TextureRect.hide()
		$TextureButton4.disabled = false
	if Global.level4_completed:
		$TextureButton5/TextureRect.hide()
		$TextureButton5.disabled = false
	if Global.level5_completed:
		$TextureButton6/TextureRect.hide()
		$TextureButton6.disabled = false
	if Global.level6_completed:
		$TextureButton7/TextureRect.hide()
		$TextureButton7.disabled = false
	if Global.level7_completed:
		$TextureButton8/TextureRect.hide()
		$TextureButton8.disabled = false

func _on_button1_pressed():
	get_tree().change_scene(dialog1)


func _on_button2_pressed():
	if Global.level1_completed:
		get_tree().change_scene(dialog2)

func _on_button3_pressed():
	if Global.level2_completed:
		get_tree().change_scene(dialog3)

func _on_button4_pressed():
	if Global.level3_completed:
		get_tree().change_scene(dialog4)


func _on_button5_pressed():
	if Global.level4_completed:
		get_tree().change_scene(dialog5)


func _on_button6_pressed():
	if Global.level5_completed:
		get_tree().change_scene(dialog6)


func _on_button7_pressed():
	if Global.level6_completed:
		get_tree().change_scene(dialog7)

func _on_button8_pressed():
	if Global.level7_completed:
		get_tree().change_scene(dialog8)
