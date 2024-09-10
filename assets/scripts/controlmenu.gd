extends Control
#своя функция в коде, вызываемая с сигналом data_loaded в SDK
func _ready():
	YandexSDK.connect("data_loaded", self, "_on_data_loaded")
	YandexSDK.init_game()
	YandexSDK.init_player()
	
	YandexSDK.load_data(["unlocked_levels"])
	print("ready_menu")
	var unlocked_levels = Global.unlocked_levels
	if Global.is_debug_enabled():
		unlocked_levels = []
		for i in range(1, Global.levels_data.size() + 1):
			unlocked_levels.append(i)
			print(i)
		print(unlocked_levels)
	
	
	for i in unlocked_levels:
		var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
		if !has_node(rect_node_path):
			continue
		get_node(rect_node_path).hide()
		get_node("TextureButton" + str(i)).disabled = false
	
	
func on_level_button_pressed(level_id: int):
	Global.current_level = level_id
	get_tree().change_scene("res://scenes/chat.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/uielements/control_game_win.tscn")
	
	
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
	
	
		
\
