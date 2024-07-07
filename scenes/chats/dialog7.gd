extends Control
var dialog_json = {
  "start": {
	"text": "Здравствуйте!",
	"options": {
	  "Здравствуйте, я хочу повышение.": {"var": "start2", "chance": 100}
	}
  },
  "start2": {
	"text": "Почему вы считаете, что заслуживаете повышения?",
	"options": {
	  "Я хорошо показал себя в прошлом месяце и долго работаю в компании.": {"var": "goodwork", "chance": 100},
	  "Я принес компании большую прибыль своей работой.": {"var": "moneyzs", "chance": 100},
	  "Мне нужно повышение, иначе я уйду, так как я ценный сотрудник.": {"var": "end_good", "chance": 59, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"}
	}
  },
  "goodwork": {
	"text": "Да, но этого недостаточно для повышения.",
	"options": {
	  "Я очень хороший работник, благодаря мне была настроена работа команды.": {"var": "goodwork_team", "chance": 100},
	  "Я приношу неплохую прибыль!": {"var": "goodwork_money", "chance": 100},
	  "Я выполняю много задач и всегда готов помочь.": {"var": "dedication", "chance": 100}
	}
  },
  "goodwork_team": {
	"text": "Это не только ваша заслуга. Начальник сыграл большую роль.",
	"options": {
	  "Разве этого уже не достаточно, чтобы повысить меня?": {"var": "end_good", "chance": 75, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Без моей помощи, команда не достигла бы таких результатов.": {"var": "team_success", "chance": 100}
	}
  },
  "team_success": {
	"text": "Ваш вклад значителен, но повышение требует более веских оснований.",
	"options": {
	  "Я также обучал новых сотрудников и внедрил эффективные методы работы.": {"var": "training", "chance": 100},
	  "Я разработал систему, которая улучшила продуктивность.": {"var": "productivity_system", "chance": 100}
	}
  },
  "training": {
	"text": "Это действительно ценно. Обучение новых сотрудников важно для компании.",
	"options": {
	  "Так почему бы не повысить меня за мои усилия?": {"var": "end_good", "chance": 85, "end":"Начальник вам поверил", "endF":"Начальник не вам поверил"},
	  "Я также организовал тренинги, которые улучшили навыки команды.": {"var": "trainings", "chance": 100}
	}
  },
  "trainings": {
	"text": "Это впечатляет. Но нам нужно больше времени, чтобы оценить результаты.",
	"options": {
	  "Я готов ждать и продолжать работать на благо компании.": {"var": "end_good", "chance": 70, "end":"Начальник вам поверил", "endF":"Начальник не вам поверил"},
	  "Мои усилия уже принесли видимые результаты.": {"var": "visible_results", "chance": 100}
	}
  },
  "visible_results": {
	"text": "Ваша работа действительно заметна. Мы рассмотрим ваше повышение.",
	"options": {
	  "Спасибо за понимание.": {"var": "end_good", "chance": 90, "end":"Начальник вам поверил и рассматривает ваше повышение", "endF":"Начальник вам не поверил"}
	}
  },
  "goodwork_money": {
	"text": "Прибыль важна, но не является единственным фактором.",
	"options": {
	  "Я также внедрил эффективные методы работы, которые улучшили производительность.": {"var": "productivity_methods", "chance": 100},
	  "Я всегда готов помочь коллегам и поддерживать команду.": {"var": "team_support", "chance": 100}
	}
  },
  "productivity_methods": {
	"text": "Это хороший аргумент. Мы ценим ваши усилия.",
	"options": {
	  "Благодаря моим методам, компания сэкономила много времени и ресурсов.": {"var": "time_saving", "chance": 100},
	  "Я могу продолжать улучшать процессы в компании.": {"var": "process_improvement", "chance": 100}
	}
  },
  "time_saving": {
	"text": "Экономия времени и ресурсов - это всегда плюс.",
	"options": {
	  "Так почему бы не повысить меня за мои достижения?": {"var": "end_good", "chance": 80, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Я также готов предложить новые идеи для дальнейшего улучшения.": {"var": "new_ideas", "chance": 100}
	}
  },
  "new_ideas": {
	"text": "Ваш энтузиазм вдохновляет. Мы рассмотрим ваше предложение.",
	"options": {
	  "Спасибо за возможность!": {"var": "end_good", "chance": 90, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"}
	}
  },
  "team_support": {
	"text": "Поддержка команды важна, но что еще вы можете предложить?",
	"options": {
	  "Я обучал новых сотрудников и внедрял новые процессы.": {"var": "training", "chance": 100},
	  "Я разработал систему для улучшения продуктивности.": {"var": "productivity_system", "chance": 100}
	}
  },
  "productivity_system": {
	"text": "Эффективные системы работы всегда ценны.",
	"options": {
	  "Благодаря этой системе, работа стала более организованной.": {"var": "organized_work", "chance": 100},
	  "Система помогла улучшить качество работы всей команды.": {"var": "team_quality", "chance": 100}
	}
  },
  "organized_work": {
	"text": "Организация работы - ключ к успеху.",
	"options": {
	  "Так почему бы не повысить меня за эти усилия?": {"var": "end_good", "chance": 85, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"}
	}
  },
  "team_quality": {
	"text": "Улучшение качества работы команды - это весомый аргумент.",
	"options": {
	  "Спасибо за признание моих усилий!": {"var": "end_good", "chance": 90, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"}
	}
  },
  "moneyzs": {
	"text": "Прибыль важна, но нужно быть не только прибыльным.",
	"options": {
	  "Я также неплохо сработался с командой.": {"var": "teamwork", "chance": 100},
	  "Деньги решают многое в бизнесе.": {"var": "money_talks", "chance": 100}
	}
  },
  "teamwork": {
	"text": "Хорошие отношения в команде важны.",
	"options": {
	  "Я помогаю коллегам и способствую развитию компании.": {"var": "end_good", "chance": 80, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Благодаря моим усилиям, работа команды улучшилась.": {"var": "team_improvement", "chance": 100}
	}
  },
  "team_improvement": {
	"text": "Улучшение работы команды - это значительный вклад.",
	"options": {
	  "Спасибо за внимание к моим достижениям!": {"var": "end_good", "chance": 90, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"}
	}
  },
  "money_talks": {
	"text": "Деньги решают многое, но не всё.",
	"options": {
	  "Я также внедрил новые методы работы для повышения эффективности.": {"var": "efficiency_methods", "chance": 100},
	  "Мои усилия помогают компании расти.": {"var": "company_growth", "chance": 100}
	}
  },
  "efficiency_methods": {
	"text": "Эффективность важна для любой компании.",
	"options": {
	  "Благодаря моим методам, мы достигли значительных успехов.": {"var": "end_good", "chance": 85, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Я могу продолжать улучшать наши процессы.": {"var": "process_improvement", "chance": 100}
	}
  },
  "company_growth": {
	"text": "Рост компании - это всегда хорошо.",
	"options": {
	  "Так почему бы не повысить меня за мой вклад?": {"var": "end_good", "chance": 80, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Я готов предложить новые идеи для дальнейшего роста.": {"var": "new_ideas", "chance": 100}
	}
  },
  "dedication": {
	"text": "Ваше стремление помогать ценно для нас.",
	"options": {
	  "Я также участвую в разработке новых проектов.": {"var": "new_projects", "chance": 100},
	  "Я всегда готов работать сверхурочно для достижения целей.": {"var": "overtime", "chance": 100}
	}
  },
  "new_projects": {
	"text": "Новые проекты важны для развития компании.",
	"options": {
	  "Мои проекты уже показали хорошие результаты.": {"var": "end_good", "chance": 85, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Я могу предложить еще больше новых идей.": {"var": "new_ideas", "chance": 100}
	}
  },
  "overtime": {
	"text": "Работа сверхурочно - это большой плюс.",
	"options": {
	  "Я готов работать еще усерднее, если получу повышение.": {"var": "end_good", "chance": 75, "end":"Начальник вам поверил", "endF":"Начальник вам не поверил"},
	  "Мои усилия уже приносят пользу компании.": {"var": "visible_results", "chance": 100}
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
var text = preload("res://scenes/uielements/dialog7/controltext.tscn")
var text2 = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")


const next_level = "res://scenes/chats/dialog8.tscn"

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
			Global.level7_completed = true
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
			Global.level7_completed = true
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
			Global.level7_completed = true
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
			Global.level7_completed = true
		show_dialog(options[options.keys()[3]]["var"]) 
		
	else:
		_func_game_over_screen()
