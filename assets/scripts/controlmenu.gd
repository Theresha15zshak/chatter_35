extends Control
#своя функция в коде, вызываемая с сигналом data_loaded в SDK
var is_button_pressed:bool = false # Переменная нажат ли кнопка меню, если да то скрываем
const TEST_LEVELS = true
func _ready():
	YandexSDK.connect("data_loaded", self, "_on_data_loaded")

	YandexSDK.init_game()
	YandexSDK.init_player()
	print("1.READY")
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



func load_dummy_levels():
	yield(get_tree().create_timer(0.003), "timeout")
	return [1,2]
	
func _on_data_loaded(data: Dictionary):
	if data.has("unlocked_levels"):
		Global.unlocked_levels = Global.str_to_list(data.unlocked_levels)
		print("ON_DATA_LOADED")
		Global.unlocked_levels
		print("WILL BE LOADED", Global.unlocked_levels)
		for i in Global.unlocked_levels:
			var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
			if !has_node(rect_node_path):
				continue
			get_node(rect_node_path).hide()
			get_node("TextureButton" + str(i)).disabled = false
	
	
		
func _on_Button_start_pressed():
	var unlocked_levels
	if (not OS.has_feature("yandex")) and TEST_LEVELS:
		unlocked_levels = yield (load_dummy_levels(), "completed")
	elif (not OS.has_feature("yandex")) and not TEST_LEVELS:
		unlocked_levels = [1]
	else:
#		for sus in range(2):
#			var a = yield(load_dummy_levels(),"completed")
		YandexSDK.load_data(["unlocked_levels"])
#			yield(yield(get_tree().create_timer(0.06), "timeout"), "completed")
#			YandexSDK.load_data(["unlocked_levels"])
	$Panel.hide()
	$Button.hide()
