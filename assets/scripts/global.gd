extends Node
const DialogData = preload("res://assets/scripts/dialog_data.gd")
const Dialog1 = preload("res://assets/scripts/dialogs/dialog1.gd")
const Dialog2 = preload("res://assets/scripts/dialogs/dialog2.gd")
const Dialog3 = preload("res://assets/scripts/dialogs/dialog3.gd")
const Dialog4 = preload("res://assets/scripts/dialogs/dialog4.gd")
const Dialog5 = preload("res://assets/scripts/dialogs/dialog5.gd")
const Dialog6 = preload("res://assets/scripts/dialogs/dialog6.gd")
const Dialog7 = preload("res://assets/scripts/dialogs/dialog7.gd")

const _DEBUG_MODE:bool = true

var unlocked_levels:Array = [1]
var current_level:int = -1
var levels_data:Array = [
	Dialog1.new().data, Dialog2.new().data, Dialog3.new().data,
	Dialog4.new().data, Dialog5.new().data, Dialog6.new().data,
	Dialog7.new().data
]

const game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
const game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
const text = preload("res://scenes/uielements/controltext.tscn")
const text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
const animation = preload("res://scenes/uielements/animation.tscn")

var coins = 0
var callback_rewarded_ad = JavaScript.create_callback(self, '_rewarded_ad')
var callback_ad = JavaScript.create_callback(self, '_ad')
onready var win = JavaScript.get_interface("window")
	
func _ready():
	YandexSDK.init_game()
	YandexSDK.init_player()
	YandexSDK.connect("data_loaded", self, "_on_data_load")
	YandexSDK.load_data(["unlocked_levels"])
	
func _on_data_load(data: Dictionary):
	unlocked_levels = data["unlocked_levels"]
	
func save_data():
	YandexSDK.save_data({
		"unlocked_levels": unlocked_levels
	})

func unlock_level(level_index: int):
	if unlocked_levels.has(level_index):
		return
	unlocked_levels.append(level_index)
	save_data()
	
func is_on_yandex()->bool:
	return OS.has_feature("yandex")

func is_debug_enabled()->bool:
	return _DEBUG_MODE && !is_on_yandex()	
	
