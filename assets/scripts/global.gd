extends Node
var level1_completed = false
var level2_completed = false
var level3_completed = false
var level4_completed = false
var level5_completed = false
var level6_completed = false
var level7_completed = false
var level8_completed = false

var game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
var game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
var text = preload("res://scenes/uielements/dialog1/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")


var coins = 0
var callback_rewarded_ad = JavaScript.create_callback(self, '_rewarded_ad')
var callback_ad = JavaScript.create_callback(self, '_ad')
onready var win = JavaScript.get_interface("window")
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
 
		

	
	
