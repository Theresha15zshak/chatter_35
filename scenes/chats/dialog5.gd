extends Control
var dialog_json = {
	"start": {
	"text": "Здравствуйте, откройте!",
	"options": {
	  "next": {"var":"start1", "chance":100},
	}
	},
	"start1": {
	"text": "Надо поговорить.",
	"options": {
		"(промолчать)": {"var":"silent", "chance":100},
		"Вы наверное ошиблись": {"var":"error", "chance":100},
		"Я не буду открывать": {"var":"nopen", "chance":100},
	}
	},
	"silent": {
	"text": "Похоже придется выбивать дверь",
	"options": {
	  "(Понадеется что дверь не выбьют)": {"var":"silent2", "chance":20},
	  "Если выбешь дверь я достану оружие": {"var":"end_good", "chance":60, "end":"Коллектор вам поверил и ушел. Теперь вы можете продолжать спокойно жить", "endF":"Коллектор не поверил вам и выбил дверь."},
	}
	},
	"silent2": {
	"text": "Надо позвать ребят. Эй открой дверь а то хуже будет.",
	"options": {
	  "(Молчать)": {"var":"silent3", "chance":100},
	}
	},
	"silent3": {
	"text": "Похоже здесь никого нет",
	"options": {
	  "(Молчать)": {"var":"end_good", "chance":100, "end":"Коллектор ушел. Теперь вы можете продолжать спокойно жить"},
	}
	},
	"error": {
	"text": "Нет все верно, тот адрес",
	"options": {
	  "Вам будет хуже если вы узнаете ,что это не тот адрес.": {"var":"end_good", "chance":67, "end":"Коллектор понял, что ошибся адресом и ушел.Теперь вы можете продолжать спокойно жить", "endF":"Коллектор вам не поверил и выбивает дверь"},
	}
	},
	"nopen": {
	"text": "Открой иначе у тебя будут проблемы!",
	"options": {
	  "Я не буду открывать!": {"var":"nopen2", "chance":67},
	}
	},
	"nopen2": {
	"text": "Открой! Сейчас мои ребят подойдут",
	"options": {
	  "Ладно": {"var":"end_bad", "chance":100},
	  "Я позвоню в полицию!": {"var":"end_good", "chance":100, "end":"Коллектор понял, что ошибся адресом и ушел.Теперь вы можете продолжать спокойно жить"},
	  "Давай зови их": {"var":"end_bad", "chance":100, "endF":"Коллектор зовет ребят и выбивает дверь"},
	}
	},
}

onready var button1text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button/Button/Label
onready var button2text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button2/Button/Label
onready var button3text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button/Button/Label
onready var button4text = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button2/Button/Label

onready var button1 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button/Button
onready var button2 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/control_button2/Button
onready var button3 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button/Button
onready var button4 = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/control_button2/Button

var start_dialog_id = "start"
var next_dialog_id
var options

var game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
var game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
var text = preload("res://scenes/uielements/dialog5/controltext.tscn")
var text2 = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog6.tscn"

func _ready():
	hide_buttons()
	print("GOYDA")
	show_dialog(start_dialog_id)
	

func _func_game_over_screen():
	var game_over_screen_instance = game_over_screen.instance()
	add_child(game_over_screen_instance)
	
func _func_game_win_screen():
	var game_win_screen_instance = game_win_screen.instance()
	add_child(game_win_screen_instance)

func get_next_level():
	return next_level
	
func get_win_text():
	return next_dialog_id["end"]
	
func get_lose_text():
	return next_dialog_id["endF"]
	
func hide_buttons():
	var buttons = [button1, button2, button3 ,button4]
	for i in range(4):
		buttons[i].hide()

func show_dialog(dialog_id):
	if dialog_id in dialog_json:
		hide_buttons()
		# Declaring vars for dialog, instance of text and 
		var dialog = dialog_json[dialog_id]
		var dialog_text = text.instance()
		#var nodes = get_node("VBoxContainer/ScrollContainer/VBoxContainer").get_child_count()
		#Assigning text to button
		options = dialog["options"]
		var buttonstext = [button1text, button2text, button3text, button4text]
		var buttons = [button1, button2, button3 ,button4]
		print(options.keys()[0],"   ", options[options.keys()[0]],"   ",options[options.keys()[0]]["var"])
		if options.keys()[0] == "next":
			get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(dialog_text)
			dialog_text.change_text(dialog["text"])
			show_dialog(options[options.keys()[0]]["var"])
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
			
			for i in range(4):
				if i < options.size():
					var option_text = options.keys()[i]
					next_dialog_id = options[option_text]
					buttonstext[i].text = "{0}".format([option_text]) 
					
					buttons[i].show()
				else:
					buttons[i].hide()


func _on_button_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var text_button = text2.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_button)
	text_button.change_text(options.keys()[0])
	#var nodes = get_node("Container/CanvasLayer/size/ScrollContainer/VBoxContainer").get_child_count()
	#text_button.global_position += Vector2(0, (nodes-1)*30)
	# I
	# | Not working
	
	#Chance check
	if chance <= options[options.keys()[0]]["chance"]:
		if options[options.keys()[0]]["var"] == "end_bad":
			_func_game_over_screen()
		if options[options.keys()[0]]["var"] == "end_good":
			_func_game_win_screen()
			Global.level5_completed = true
		show_dialog(options[options.keys()[0]]["var"]) 
		
	else:
		_func_game_over_screen()


func _on_button_2_pressed():
		# Declaring chance and adding text
	var chance = randi() % 100+1
	var text_button = text2.instance()
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_button)
	text_button.change_text(options.keys()[1])
	#var nodes = get_node("Container/CanvasLayer/size/ScrollContainer/VBoxContainer").get_child_count()
	#text_button.global_position += Vector2(0, (nodes-1)*30)
	print(options[options.keys()[1]],"KEYS")
	#Chance check
	if chance <= options[options.keys()[1]]["chance"]:
		if options[options.keys()[1]]["var"] == "end_bad":
			_func_game_over_screen()
		if options[options.keys()[1]]["var"] == "end_good":
			_func_game_win_screen()
			Global.level5_completed = true
		show_dialog(options[options.keys()[1]]["var"]) 
		
	else:
		_func_game_over_screen()


func _on_button_3_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var text_button = text2.instance()
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_button)
	text_button.change_text(options.keys()[2])
	#var nodes = get_node("Container/CanvasLayer/size/ScrollContainer/VBoxContainer").get_child_count()
	#text_button.global_position += Vector2(0, (nodes-1)*30)
	
	#Chance check
	if chance <= options[options.keys()[2]]["chance"]:
		if options[options.keys()[2]]["var"] == "end_bad":
			_func_game_over_screen()
		if options[options.keys()[2]]["var"] == "end_good":
			_func_game_win_screen()
			Global.level5_completed = true
		show_dialog(options[options.keys()[2]]["var"]) 
		
	else:
		_func_game_over_screen()


func _on_button_4_pressed():
	# Declaring chance and adding text
	var chance = randi() % 100+1
	var text_button = text2.instance()
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_button)
	text_button.change_text(options.keys()[3])
	#var nodes = get_node("Container/CanvasLayer/size/ScrollContainer/VBoxContainer").get_child_count()
	#text_button.global_position += Vector2(0, (nodes-1)*30)
	
	#Chance check
	if chance <= options[options.keys()[3]]["chance"]:
		if options[options.keys()[3]]["var"] == "end_bad":
			_func_game_over_screen()
		if options[options.keys()[3]]["var"] == "end_good":
			_func_game_win_screen()
			Global.level5_completed = true
		show_dialog(options[options.keys()[3]]["var"]) 
		
	else:
		_func_game_over_screen()
