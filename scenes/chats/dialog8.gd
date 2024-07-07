extends Control
var dialog_json = {
  "start": {
	"text": "Вы находитесь у входа на рок-концерт. Что вы хотите сделать в первую очередь?",
	"options": {
	  "Найти свои места": {"var": "find_seat", "chance": 100},
	  "Купить мерч и сувениры": {"var": "merch_stand", "chance": 100},
	  "Пойти к сцене": {"var": "go_to_stage", "chance": 100}
	}
  },
  "find_seat": {
	"text": "Вы нашли свои места и видите друзей. Присоединиться к ним?",
	"options": {
	  "Да, присоединиться к друзьям": {"var": "join_friends", "chance": 100},
	  "Нет, остаться на своем месте": {"var": "stay_seat", "chance": 100}
	}
  },
  "join_friends": {
	"text": "Вы присоединились к друзьям. Начать подпевать?",
	"options": {
	  "Да, подпевать": {"var": "sing_along", "chance": 100},
	  "Нет, снимать видео": {"var": "record_video", "chance": 100}
	}
  },
  "stay_seat": {
	"text": "Рядом с вами садится известный музыкант. Поговорить с ним?",
	"options": {
	  "Да, поговорить": {"var": "talk_musician", "chance": 100},
	  "Нет, оставить его в покое": {"var": "leave_musician", "chance": 100}
	}
  },
  "merch_stand": {
	"text": "Вы подошли к стенду с мерчем. Что купите?",
	"options": {
	  "Купить футболку": {"var": "buy_tshirt", "chance": 100},
	  "Купить постер": {"var": "buy_poster", "chance": 100},
	  "Купить альбом": {"var": "buy_album", "chance": 100}
	}
  },
  "go_to_stage": {
	"text": "Вы подошли к сцене и видите, как музыканты готовятся. Пойти за кулисы?",
	"options": {
	  "Да, пойти за кулисы": {"var": "backstage", "chance": 100},
	  "Нет, остаться у сцены": {"var": "stay_stage", "chance": 100}
	}
  },
  "sing_along": {
	"text": "Вы начинаете подпевать, концерт становится еще лучше. Продолжить наслаждаться концертом?",
	"options": {
	  "Да, продолжить": {"var": "end_good", "chance": 100, "end":"Вы отлично провели время"}
	}
  },
  "record_video": {
	"text": "Вы снимаете видео концерта. Продолжить снимать?",
	"options": {
	  "Да, продолжить": {"var": "end_good", "chance": 100, "end":"Вы отлично провели время"}
	}
  },
  "talk_musician": {
	"text": "Музыкант приглашает вас за кулисы. Пойти?",
	"options": {
	  "Да, пойти": {"var": "backstage", "chance": 100},
	  "Нет, остаться на месте": {"var": "end_good", "chance": 100, "end":"Вы отлично провели время"}
	}
  },
  "leave_musician": {
	"text": "Вы оставили музыканта в покое и наслаждаетесь концертом. Продолжить?",
	"options": {
	  "Да, продолжить": {"var": "end_good", "chance": 100, "end":"Вы отлично провели время"}
	}
  },
  "buy_tshirt": {
	"text": "Вы купили футболку. Что дальше?",
	"options": {
	  "Найти свои места": {"var": "find_seat", "chance": 100},
	  "Пойти к сцене": {"var": "go_to_stage", "chance": 100}
	}
  },
  "buy_poster": {
	"text": "Вы купили постер. Что дальше?",
	"options": {
	  "Найти свои места": {"var": "find_seat", "chance": 100},
	  "Пойти к сцене": {"var": "go_to_stage", "chance": 100}
	}
  },
  "buy_album": {
	"text": "Вы купили альбом. Что дальше?",
	"options": {
	  "Найти свои места": {"var": "find_seat", "chance": 100},
	  "Пойти к сцене": {"var": "go_to_stage", "chance": 100}
	}
  },
  "backstage": {
	"text": "Вы попали за кулисы. Помогать музыкантам с настройкой инструментов?",
	"options": {
	  "Да, помочь": {"var": "help_backstage", "chance": 100},
	  "Нет, просто понаблюдать": {"var": "observe_backstage", "chance": 100}
	}
  },
  "stay_stage": {
	"text": "Вы остались у сцены и видите, как музыканты выходят на сцену. Подпевать?",
	"options": {
	  "Да, подпевать": {"var": "sing_along", "chance": 100}
	}
  },
  "help_backstage": {
	"text": "Вы помогли музыкантам и получили возможность пообщаться с ними. Вернуться в зал?",
	"options": {
	  "Да, вернуться": {"var": "end_good", "chance": 100, "end":"Вы отлично провели время"}
	}
  },
  "observe_backstage": {
	"text": "Вы наблюдаете за приготовлениями. Вернуться в зал?",
	"options": {
	  "Да, вернуться": {"var": "end_good", "chance": 100, "end":"Вы отлично провели время"}
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
var text = preload("res://scenes/uielements/dialog8/controltext.tscn")
var text2 = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")


const next_level = "res://scenes/controlmenu.tscn"

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
			Global.level8_completed = true
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
			Global.level8_completed = true
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
			Global.level8_completed = true
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
			Global.level8_completed = true
		show_dialog(options[options.keys()[3]]["var"]) 
		
	else:
		_func_game_over_screen()
