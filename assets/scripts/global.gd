extends Node

const DialogData = preload("res://assets/scripts/dialog_data.gd")
const Dialog1 = preload("res://assets/scripts/dialogs/dialog1.gd")
const Dialog2 = preload("res://assets/scripts/dialogs/dialog2.gd")
const Dialog3 = preload("res://assets/scripts/dialogs/dialog3.gd")
const Dialog4 = preload("res://assets/scripts/dialogs/dialog4.gd")
const Dialog5 = preload("res://assets/scripts/dialogs/dialog5.gd")
const Dialog6 = preload("res://assets/scripts/dialogs/dialog6.gd")
const Dialog7 = preload("res://assets/scripts/dialogs/dialog7.gd")
const Dialog8 = preload("res://assets/scripts/dialogs/dialog8.gd")
const Dialog9 = preload("res://assets/scripts/dialogs/dialog9.gd")
const _DEBUG_MODE:bool = false

var unlocked_levels:Array = []
var current_level:int = -1
var levels_data:Array = [
	Dialog1.new().data, Dialog2.new().data, Dialog3.new().data,
	Dialog4.new().data, Dialog5.new().data, Dialog6.new().data,
	Dialog7.new().data,Dialog8.new().data,Dialog9.new().data
]

const game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
const game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
const text = preload("res://scenes/uielements/controltext.tscn")
const text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
const animation = preload("res://scenes/uielements/animation.tscn")

func _enter_tree():
	
#		yield(get_tree().create_timer(5), "timeout")
#		for i in unlocked_levels:
#			var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
#			if !has_node(rect_node_path):
#				continue
#			get_node(rect_node_path).hide()
#			get_node("TextureButton" + str(i)).disabled = false
	
#	yield(get_tree().create_timer(8), "timeout")
	print("enter_tree")

	
func _ready():
	print("1.GLOBAL")
#	for a in range(2):
#		yield(get_tree().create_timer(5), "timeout")
#		YandexSDK.load_data(["unlocked_levels"])
#		yield(get_tree().create_timer(0.003), "timeout")
#		YandexSDK.load_data(["unlocked_levels"])
#		yield(get_tree().create_timer(0.003), "timeout")
#		YandexSDK.load_data(["unlocked_levels"])
#		yield(get_tree().create_timer(0.003), "timeout")
#		YandexSDK.load_data(["unlocked_levels"])
#		yield(get_tree().create_timer(0.003), "timeout")
#		YandexSDK.load_data(["unlocked_levels"])
#		yield(get_tree().create_timer(0.02), "timeout")
##		var unlocked_levels = Global.unlocked_levels
#		print("WILL BE LOADED  ",unlocked_levels,"   ",a )
#		yield(get_tree().create_timer(2.3), "timeout")
#
#
#	print("UNLOCKED_LEVELS!  ", unlocked_levels)
#	print("ready")
	


func save_data():
	print("WILL BE SAVED  ",unlocked_levels,"   ",typeof(unlocked_levels))
	YandexSDK.save_data({
		"unlocked_levels": str(unlocked_levels)
	})
		

		

#func _on_unlocked_levels_loaded(data: Dictionary):
#	if data.has("test"):
#		unlocked_levels = str_to_list(data.unlocked_levels)

func unlock_level(level_index: int):
	unlocked_levels.append(level_index)
	save_data()

	
func is_debug_enabled()->bool:
	return _DEBUG_MODE

func str_to_list(string_):
	var answer = []
	for i in string_:
		if i in "123456789":
			answer.append(i)
	return answer

func _exit_tree():
	print("exit_tree")
