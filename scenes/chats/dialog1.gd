extends Control

var dialog_json = {
	"start": {
		"text": "Привет! Пройди тест по майнкрафту",
		"options": [
			{"text": "next", "params": {"next": "start_1", "chance": 100}}
		],
	},
	"start_1": {
		"text": "Какое главное правило майнкрафта?",
		"options": [
			{"text": "Не копать под себя", "params": {"next": "start_2", "chance": 100}},
			{"text": "Не приближатся к криперу", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Не срубать первый блок дерева", "params": {"next": "end_bad", "chance": 100}}
		],
	},
	"start_2": {
		"text": "Какой самый редкий ресурс в майнкрафте?",
		"options": [
			{"text": "Рудное золото", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Алмазы", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Незеритовые обломки", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Изумрудная руда", "params": {"next": "start_3", "chance": 100}}
		],
	},
	"start_3": {
		"text": "Какая броня дает больше защиты кольчужная или золотая?",
		"options": [
			{"text": "Кольчужная", "params": {"next": "start_4", "chance": 100}},
			{"text": "Золотая", "params": {"next": "end_bad", "chance": 100}}
		],
	},
	"start_4": {
		"text": "Какой моб майнкрафта самый маленький?",
		"options": [
			{"text": "Зомби", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Камень", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Чешуйница", "params": {"next": "start_5", "chance": 100}},
			{"text": "Кошка", "params": {"next": "end_bad", "chance": 100}}
		],
	},
	"start_5": {
		"text": "Какой моб майнкрафта может заражать других мобов?",
		"options": [
			{"text": "Зомби", "params": {"next": "start_6", "chance": 100}},
			{"text": "Дракон", "params": {"next": "end_bad1", "chance": 100}},
			{"text": "Крипер", "params": {"next": "end_bad", "chance": 100}}
		],
	},
	"start_6": {
		"text": "Финальный вопрос. При прыжке на какой блок вы отпрыгните?",
		"options": [
			{"text": "Слизневый блок", "params": {"next": "end_good", "chance": 100}},
			{"text": "Медовый блок", "params": {"next": "end_bad", "chance": 100}},
			{"text": "Полублок", "params": {"next": "end_bad", "chance": 100}}
		],
	},
	"end_bad": {
		"text": "К сожалению вы проиграли",
		"options": [],
		"end_type": "lose"
	},
	"end_bad1": {
		"text": "К сожалению вы проиграли",
		"options": [],
		"end_type": "lose"
	},
	"end_good": {
		"text": "Поздравляю! Вы прошли тест.",
		"options": [],
		"end_type": "win"
	}
}


# Commit
onready var button1text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button/Button/Label
onready var button2text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button2/Button/Label
onready var button3text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button/Button/Label
onready var button4text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button2/Button/Label

onready var button1 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button/Button
onready var button2 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button2/Button
onready var button3 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button/Button
onready var button4 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button2/Button



const start_dialog_id = "start"
var current_dialog_id = "start"
var options

var game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
var game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
var text = preload("res://scenes/uielements/dialog1/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog2.tscn"

func _ready():
	hide_buttons()
	print("GOYDA")
	show_dialog(start_dialog_id)
	

func get_next_level():
	return next_level
	
func get_win_text():
	return dialog_json[current_dialog_id["end"]]
	
func get_lose_text():
	return dialog_json[current_dialog_id["end"]]

func _func_game_end_screen(result):
	var game_over_screen_instance = game_over_screen.instance()
	var game_win_screen_instance = game_win_screen.instance()
	if result == "lose":
		add_child(game_over_screen_instance)
	else:
		add_child(game_win_screen_instance)

	
func hide_buttons():
	var buttons = [button1, button2, button3 ,button4]
	for i in range(4):
		buttons[i].hide()

func show_dialog(dialog_id):
	current_dialog_id = dialog_id
	if dialog_id in dialog_json:
		hide_buttons()
		# Declaring vars for dialog, instance of text and 
		var dialog = dialog_json[dialog_id]
		var dialog_text = text.instance()
		#var nodes = get_node("VBoxContainer/ScrollContainer/VBoxContainer").get_child_count()
		#Assigning text to button
		options = dialog["options"]
		if len(dialog["options"]) == 1:
			if options[0]["text"] == "next":
				get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(dialog_text)
				dialog_text.change_text(dialog["text"])
				show_dialog(options[0]["params"]["next"])
		else:
			# Animation
			var animation_instance = animation.instance()
			get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(animation_instance)
			# Timer for animation
			var time_in_seconds = 0.5
			yield(get_tree().create_timer(time_in_seconds), "timeout")
			# hiding animation
			var animka = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/animation
			animka.queue_free()
			# Assigning text to text
			get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(dialog_text)
			dialog_text.change_text(dialog["text"])
			
			
			# assigning text to button and show/hide buttons
			
			var buttonstext = [button1text, button2text, button3text, button4text]
			var buttons = [button1, button2, button3 ,button4]
			
			for i in range(4):
				if i < options.size():
					var option_text = options[i]["text"]
					print(typeof(option_text))
					buttonstext[i].text = "{0}".format([option_text]) 
					
					buttons[i].show()
				else:
					buttons[i].hide()
					
					
		if len(dialog["options"]) == 0: 
			_func_game_end_screen(dialog_json[dialog_id]["end_type"])
func next_action(chance, get_cahnce, dialog_to_show):
	if chance <= get_cahnce:
		show_dialog(dialog_to_show)


func _on_button_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var index_i = 0
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])
	
	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])

func _on_button_2_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var index_i = 1
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])
	
	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])
func _on_button_3_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var index_i = 2
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])
	
	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])


func _on_button_4_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var index_i = 3
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])
	
	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])


func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")
