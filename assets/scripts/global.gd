extends Node
const DialogData = preload("res://assets/scripts/dialog_data.gd")
const Dialog1 = preload("res://assets/scripts/dialogs/dialog1.gd")
const Dialog2 = preload("res://assets/scripts/dialogs/dialog2.gd")
const Dialog3 = preload("res://assets/scripts/dialogs/dialog3.gd")
const Dialog4 = preload("res://assets/scripts/dialogs/dialog4.gd")
const Dialog5 = preload("res://assets/scripts/dialogs/dialog5.gd")
const Dialog6 = preload("res://assets/scripts/dialogs/dialog6.gd")
const Dialog7 = preload("res://assets/scripts/dialogs/dialog7.gd")

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

func unlock_level(level_index: int):
	if unlocked_levels.has(level_index):
		return
	unlocked_levels.append(level_index)

func js_show_ad():
	win.ShowAd(callback_ad)
	# Здесь можно приостановить музыку / звуки
func js_show_rewarded_ad():
	win.ShowAdRewardedVideo()
	# Здесь можно приостановить музыку / звуки
func _rewarded_ad(args):
	print(args[0])
	coins += 10
	# Здесь можно возобновить музыку / звуки
func _ad(args):
	print(args[0])
	# Здесь можно возобновить музыку / звуки
 
		

	
	
