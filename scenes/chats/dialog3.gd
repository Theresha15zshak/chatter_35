extends Control
var dialog_json = {
  "start": {
	"text": "Здравствуйте! Я курьер и не могу найти ваш дом.",
	"options": {
	  "Какой курьер?": {"var": "what", "chance": 100},
	  "Где вы сейчас?": {"var": "where", "chance": 100}
	}
  },
  "what": {
	"text": "Вы заказывали доставку еды на сайте.",
	"options": {
	  "Вспомнил! Где вы сейчас?": {"var": "where", "chance": 100},
	  "Не помню такого. Возможно, вы ошиблись.": {"var": "end_bad", "chance": 100}
	}
  },
  "where": {
	"text": "Я возле метро, здесь все замело снегом.",
	"options": {
	  "Какая станция метро?": {"var": "searching", "chance": 100},
	  "Попробуйте найти дорогу к 5-му дому через карту. (Риск)": {"var": "risk_path", "chance": 100}
	}
  },
  "searching": {
	"text": "Станция метро Новокузнецкая.",
	"options": {
	  "Пройдите через местный лес по тропинке, она приведет вас к двору.": {"var": "forest", "chance": 100}
	}
  },
  "forest": {
	"text": "Я в лесу. Здесь много тропинок. Куда идти дальше?",
	"options": {
	  "Идите прямо, пока не увидите старый колодец, затем налево.": {"var": "well", "chance": 100},
	  "Сверните направо на первую развилке, потом снова направо.": {"var": "wrong_way", "chance": 100}
	}
  },
  "well": {
	"text": "Я нашел колодец. Что теперь?",
	"options": {
	  "От колодца идите налево до конца тропинки.": {"var": "searching2", "chance": 100},
	  "Пройдите мимо колодца и сверните направо.": {"var": "lost", "chance": 100}
	}
  },
  "wrong_way": {
	"text": "Я кажется заблудился. Здесь нет выхода.",
	"options": {
	  "Вернитесь к началу леса и попробуйте снова.": {"var": "forest", "chance": 100},
	  "Попробуйте найти кого-то для помощи.": {"var": "end_bad", "chance": 100}
	}
  },
  "lost": {
	"text": "Я снова потерялся. Не вижу никаких ориентиров.",
	"options": {
	  "Вернитесь к колодцу и следуйте инструкциям заново.": {"var": "well", "chance": 100},
	  "Поищите другой путь.": {"var": "end_bad", "chance": 100}
	}
  },
  "searching2": {
	"text": "Я вышел из леса и вижу жилой район. Куда дальше?",
	"options": {
	  "Идите к большому красному зданию, затем налево.": {"var": "residential", "chance": 100},
	  "Ищите 5-й подъезд в синем доме.": {"var": "residential2", "chance": 100}
	}
  },
  "residential": {
	"text": "Я у большого красного здания. Где ваш дом?",
	"options": {
	  "Продолжайте идти налево до 5-го подъезда.": {"var": "finded_path", "chance": 100},
	  "Вы ошиблись. Вернитесь назад.": {"var": "searching2", "chance": 100}
	}
  },
  "residential2": {
	"text": "Я у синего дома. Нашел 5-й подъезд.",
	"options": {
	  "Отлично, заходите в 5-й подъезд.": {"var": "finded_path", "chance": 100},
	  "Это не тот дом.": {"var": "searching2", "chance": 100}
	}
  },
  "risk_path": {
	"text": "Попробую использовать карту, но здесь плохая видимость.",
	"options": {
	  "Осторожно следуйте указаниям карты.": {"var": "searching", "chance": 100},
	  "Вернитесь к метро и попробуйте другой путь.": {"var": "searching", "chance": 100}
	}
  },
  "finded_path": {
	"text": "Отлично, я нашел ваш дом. Скоро буду с вашей едой!",
	"options": {
	  "Отлично, жду вас!": {"var": "end_good", "chance": 100}
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

var current_dialog_id = "start"
var next_dialog_id
var options

var game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
var game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
var text = preload("res://scenes/uielements/dialog3/controltext.tscn")
var text2 = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog4.tscn"

func _ready():
	hide_buttons()
	print("GOYDA")
	show_dialog(current_dialog_id)
	

func _func_game_over_screen():
	var game_over_screen_instance = game_over_screen.instance()
	add_child(game_over_screen_instance)
	
func _func_game_win_screen():
	var game_win_screen_instance = game_win_screen.instance()
	add_child(game_win_screen_instance)

func get_next_level():
	return next_level
	
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
			Global.level3_completed = true
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
			Global.level3_completed = true
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
			Global.level3_completed = true
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
			Global.level3_completed = true
		show_dialog(options[options.keys()[3]]["var"]) 
		
	else:
		_func_game_over_screen()
