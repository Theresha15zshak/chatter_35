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

var unlocked_levels:Array = [1]
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

func _ready():
	YandexSDK.connect("data_loaded", self, "_on_data_load")
	YandexSDK.load_data(["unlocked_levels"])
	YandexSDK.init_game()
	YandexSDK.init_player()
	

func save_data():
	YandexSDK.save_data({
		"unlocked_levels": unlocked_levels
	})
		
func _on_data_load(data: Dictionary):
	unlocked_levels = data["unlocked_levels"]
	
func unlock_level(level_index: int):
	if unlocked_levels.has(level_index):
		return
	unlocked_levels.append(level_index)
	save_data()

	
func is_debug_enabled()->bool:
	return _DEBUG_MODE


	
