extends Control
#своя функция в коде, вызываемая с сигналом data_loaded в SDK
var is_button_pressed:bool = false # Переменная нажат ли кнопка меню, если да то скрываем
const TEST_LEVELS = true
func _ready():
#	Global.connect("Data_loaded",self, "")
#	yield(self, "Data_loaded")
	print("ready_menu")
	var unlocked_levels = Global.unlocked_levels
	if Global.is_debug_enabled():
		unlocked_levels = []
		for i in range(1, Global.levels_data.size() + 1):
			unlocked_levels.append(i)
			print(i)
		print(unlocked_levels)
		
	elif is_button_pressed:
		$Panel.hide()
		$Button.hide()
	
	
	for i in unlocked_levels:
		var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
		if !has_node(rect_node_path):
			continue
		get_node(rect_node_path).hide()
		get_node("TextureButton" + str(i)).disabled = false
	
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
	
func on_level_button_pressed(level_id: int):
	Global.current_level = level_id
	get_tree().change_scene("res://scenes/chat.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/uielements/control_game_win.tscn")






func _on_Button_start_pressed():
	var unlocked_levels
	if (not OS.has_feature("yandex")) and TEST_LEVELS:
		unlocked_levels = [1,2]
	elif (not OS.has_feature("yandex")) and not TEST_LEVELS:
		unlocked_levels = [1]
	else:
		for sus in range(2):
			YandexSDK.load_data(["unlocked_levels"])
			yield(get_tree().create_timer(0.06), "timeout")
			YandexSDK.load_data(["unlocked_levels"])
		unlocked_levels = Global.unlocked_levels
	print("WILL BE LOADED", unlocked_levels)
	for i in unlocked_levels:
		var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
		if !has_node(rect_node_path):
			continue
		get_node(rect_node_path).hide()
		get_node("TextureButton" + str(i)).disabled = false
	
	$Panel.hide()
	$Button.hide()
