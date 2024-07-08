extends Control
var dialog_json = {
  "start": {
	"text": "Вы в древней пещере. Ваша цель - найти золото.",
	"options": {
	  "next": {"var": "start1", "chance": 100}
	}
  },
  "start1": {
	"text": "Перед вами три прохода: налево, направо и прямо. Куда пойдете?",
	"options": {
	  "Налево": {"var": "left", "chance": 100},
	  "Направо": {"var": "right", "chance": 100},
	  "Прямо": {"var": "straight", "chance": 100}
	}
  },
  "left": {
	"text": "Левая дверь ведет в комнату с рычагом. Что сделаете?",
	"options": {
	  "Потянуть за рычаг": {"var": "lever", "chance": 100},
	  "Вернуться": {"var": "start", "chance": 100}
	}
  },
  "lever": {
	"text": "Пол проваливается. Оставаться здесь опасно. Идти на звук шагов или ждать?",
	"options": {
	  "Идти на звук шагов": {"var": "steps", "chance": 100},
	  "Ждать": {"var": "end_bad", "chance": 100, "endF":"Пол под вами провалился и вы умерли"}
	}
  },
  "steps": {
	"text": "Вы видите старика, который предлагает помощь. Поверить ему?",
	"options": {
	  "Поверить": {"var": "follow_old_man", "chance": 100},
	  "Отказаться": {"var": "end_bad", "chance": 100, "endF":"У вас нет способа спастись и вы умираете"}
	}
  },
  "follow_old_man": {
	"text": "Старик ведет вас к статуе. Нужно решить головоломку. Попытаться решить?",
	"options": {
	  "Решить головоломку": {"var": "puzzle", "chance": 100},
	  "Попробовать открыть силой": {"var": "end_bad", "chance": 100,"endF":"Решение силой не привело к чему либо хорошему"}
	}
  },
  "puzzle": {
	"text": "Руны: 'Сила воды превыше огня'. Выберите правильный порядок.",
	"options": {
	  "Вода-Огонь-Земля-Воздух": {"var": "end_good", "chance": 100,"end":"Вы решили загадку правильно и теперь вы спасены"},
	  "Огонь-Вода-Воздух-Земля": {"var": "end_bad", "chance": 100,"endF":"Вы решили загадку неправильно и теперь ваша судьба не завидна"}
	}
  },
  "right": {
	"text": "Перед вами два призрака. 'Что не имеет начала и конца?'",
	"options": {
	  "Кольцо": {"var": "ring", "chance": 100},
	  "Время": {"var": "end_bad", "chance": 100, "endF":"Вы ошиблись и теперь ваша судьба не завидна"}
	}
  },
  "ring": {
	"text": "Призраки исчезают, открывая путь к золоту.",
	"options": {
	  "Подобрать золото": {"var": "n_go", "chance": 100},
	  "Оставить золото": {"var": "end_bad", "chance": 100, "endF":"Вы остались без сокровищ и не достигли своей цели"}
	}
  },
  "straight": {
	"text": "Перед вами подземная река с хрупким мостом. Что сделать?",
	"options": {
	  "Перейти мост": {"var": "cross_bridge", "chance": 100},
	  "Искать другой путь": {"var": "find_path", "chance": 100}
	}
  },
  "cross_bridge": {
	"text": "Вы переходите мост и видите золотую дверь.",
	"options": {
	  "Открыть дверь": {"var": "golden_door", "chance": 100},
	  "Вернуться": {"var": "start", "chance": 100}
	}
  },
  "find_path": {
		"text": "Вы находите лодку и переплываете реку. 'Что принадлежит вам, но другие используют чаще?'",
	"options": {
	  "Имя": {"var": "end_good", "chance": 100, "end":"Вы решили загадку и спаслись"},
	  "Тень": {"var": "end_bad", "chance": 100, "endF":"Вы проиграли и теперь ваша участь не завидна"}
	}
  },
  "golden_door": {
	"text": "Дверь открывается, вы видите сокровища.",
	"options": {
	  "Подобрать золото": {"var": "n_go", "chance": 100},
	  "Закрыть дверь": {"var": "start", "chance": 100}
	}
  },
  "n_go": {
	"text": "Начинается землетрясение. Оставаться здесь опасно. Ваши действия?",
	"options": {
	  "Создать гранату": {"var": "end_bad", "chance": 100, "endF": "Граната подрывает все и убивает вас"},
	  "Бежать": {"var": "n_go2", "chance": 100},
	  "Ждать помощи": {"var": "end_bad", "chance": 100, "endF": "Вы остались ждать помощи, но никто вам не помог и теперь ваша участь не завидна"}
	}
  },
  "n_go2": {
	"text": "Выход заблокирован кодовой панелью: 'X---'. После X следует Y, после Y — X.",
	"options": {
	  "XYXY": {"var": "end_good", "chance": 100,"end":"Хоть вы и не получили золота, главное ,что вы спаслись!"},
	  "XXYX": {"var": "end_bad", "chance": 100,"endF":"Вы решили загадку неправильно и теперь ваша судьба не завидна"},
	  "XYYX": {"var": "end_bad", "chance": 100,"endF":"Вы решили загадку неправильно и теперь ваша судьба не завидна"}
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
var text = preload("res://scenes/uielements/dialog2/controltext.tscn")
var text2 = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog3.tscn"

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
			Global.level2_completed = true
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
			Global.level2_completed = true
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
			Global.level2_completed = true
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
			Global.level2_completed = true
		show_dialog(options[options.keys()[3]]["var"]) 
		
	else:
		_func_game_over_screen()
