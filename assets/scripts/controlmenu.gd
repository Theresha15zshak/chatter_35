extends Control
#своя функция в коде, вызываемая с сигналом data_loaded в SDK

func _ready():
	var unlocked_levels = Global.str_to_list(Global.unlocked_levels)
	if Global.is_debug_enabled():
		unlocked_levels = []
		for i in range(1, Global.levels_data.size() + 1):
			unlocked_levels.append(i)
	
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





func _on_Button_b_pressed():
	$Panel.hide()
	YandexSDK.load_data(["unlocked_levels"])
	YandexSDK.load_data(["unlocked_levels"])
	YandexSDK.load_data(["unlocked_levels"])
	var unlocked_levels = Global.str_to_list(Global.unlocked_levels)
	print("WILL BE LOADED  ",unlocked_levels,"   ",typeof(unlocked_levels))
	for i in unlocked_levels:
		var rect_node_path = "TextureButton" + str(i) + "/TextureRect"
		if !has_node(rect_node_path):
			continue
		get_node(rect_node_path).hide()
		get_node("TextureButton" + str(i)).disabled = false
