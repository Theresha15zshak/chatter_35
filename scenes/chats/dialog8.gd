extends Control
signal answers_ended
signal animation_ended
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


const start_dialog_id = "start"
var current_dialog_id = "start"
var options

var game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
var game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
var text = preload("res://scenes/uielements/dialog8/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/controlmenu.tscn"

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
	yield(get_tree().create_timer(0.861), "timeout")
	if result == "lose":
		add_child(game_over_screen_instance)
	elif result == "win":
		Global.level8_completed = true
		add_child(game_win_screen_instance)
	else:
		push_error("Wrong end type {0}").format([result])
	
func hide_buttons():
	pass 
	

	for b in [button1, button2, button3 ,button4]:
		b.hide()



func play_animation(time_in_seconds):
	var animation_instance = animation.instance()
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(animation_instance)
	# Timer for animation
	yield(get_tree().create_timer(time_in_seconds), "timeout")
	# hiding animation
	var animka = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/animation
	animation_instance.queue_free()
	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("animation_ended")
func draw_comp_answer(t):
	var comp_dialog_text = text.instance()
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(comp_dialog_text)
	comp_dialog_text.change_text(t)

func draw_answer_options(options):
	yield(self, "answers_ended")
	var buttonstext = [button1text, button2text, button3text, button4text]
	var buttons = [button1, button2, button3 ,button4]
	for i in range(options.size()):
		var option_text = options[i]["text"]
		buttonstext[i].text = "{0}".format([option_text]) 
		buttons[i].show()

func draw_answers(dialog):
	for t in dialog["text"]:
		play_animation(0.5)
		# Assigning text to text
		yield(self, "animation_ended")
		draw_comp_answer(t)
	emit_signal("answers_ended")
		
func show_dialog(dialog_id):
	if not (dialog_id in dialog_json):
		push_error("Can't find dialog id")
	
	hide_buttons()	
	current_dialog_id = dialog_id
	# Declaring vars for dialog, instance of text and 
	var dialog = dialog_json[dialog_id]

	draw_answers(dialog)
		
	if len(dialog["options"]) == 0: 
		_func_game_end_screen(dialog_json[dialog_id]["end_type"])
	
	options = dialog["options"]
	draw_answer_options(options)
	
			
func next_action(chance, get_cahnce, dialog_id_to_show):
	if chance <= get_cahnce:
		show_dialog(dialog_id_to_show)
	else:
		_func_game_end_screen("lose")


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
