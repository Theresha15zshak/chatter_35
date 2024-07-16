extends Control
signal answers_ended
signal animation_ended
var dialog_json = {
  "start": {
	"text": ["Почему ты не на уроке?!"],
	"options": [
	  {"text": "Извините, я заболел.", "params": {"next": "sick", "chance": 100}},
	  {"text": "Мне нужно было помочь родителям.", "params": {"next": "help_parents", "chance": 100}},
	  {"text": "Я забыл про урок.", "params": {"next": "forgot", "chance": 100}},
	  {"text": "У меня была важная встреча.", "params": {"next": "meeting", "chance": 100}}
	]
  },
  "sick": {
	"text": ["Правда? И чем же ты заболел?"],
	"options": [
	  {"text": "У меня простуда.", "params": {"next": "cold", "chance": 100}},
	  {"text": "Очень болит голова.", "params": {"next": "headache", "chance": 100}},
	  {"text": "У меня температура.", "params": {"next": "fever", "chance": 100}}
	]
  },
  "cold": {
	"text": ["Простуда? Но ты можешь прийти в маске."],
	"options": [
	  {"text": "Ладно, я приду.", "params": {"next": "end_bad", "chance": 100, "endF": "Учитель заставил вас прийти на урок."}},
	  {"text": "Но я плохо себя чувствую.", "params": {"next": "still_sick", "chance": 100}}
	]
  },
  "headache": {
	"text": ["Болит голова? Может тебе выпить таблетку и прийти?"],
	"options": [
	  {"text": "Ладно, я приду.", "params": {"next": "end_bad", "chance": 100, "endF": "Учитель заставил вас прийти на урок."}},
	  {"text": "Но я очень плохо себя чувствую.", "params": {"next": "still_sick", "chance": 100}}
	]
  },
  "fever": {
	"text": ["Температура? Тогда тебе лучше остаться дома."],
	"options": [
	  {"text": "Спасибо, я так и сделаю.", "params": {"next": "end_good", "chance": 100, "end": "Учитель поверил и отпустил вас домой."}}
	]
  },
  "still_sick": {
	"text": ["Хорошо, оставайся дома и выздоравливай."],
	"options": [
	  {"text": "Спасибо, я так и сделаю.", "params": {"next": "end_good", "chance": 100, "end": "Учитель поверил и отпустил вас домой."}}
	]
  },
  "help_parents": {
	"text": ["Помогал родителям? Это важно, но учеба важнее."],
	"options": [
	  {"text": "Я знаю, постараюсь больше не пропускать.", "params": {"next": "end_warning", "chance": 100, "end": "Учитель дал вам предупреждение."}},
	  {"text": "Это было очень срочно.", "params": {"next": "urgent_help", "chance": 100}}
	]
  },
  "urgent_help": {
	"text": ["Что же было такого срочного?"],
	"options": [
	  {"text": "Был семейный кризис.", "params": {"next": "end_good", "chance": 50, "end": "Учитель понял и отпустил вас.", "endF": "Учитель не поверил и вы получили замечание."}}
	]
  },
  "forgot": {
	"text": ["Забыл про урок? Это неприемлемо."],
	"options": [
	  {"text": "Извините, больше не повторится.", "params": {"next": "end_warning", "chance": 100, "end": "Учитель дал вам предупреждение."}},
	  {"text": "Я перепутал расписание.", "params": {"next": "schedule_confusion", "chance": 100}}
	]
  },
  "schedule_confusion": {
	"text": ["Следи за расписанием внимательнее."],
	"options": [
	  {"text": "Обязательно, спасибо.", "params": {"next": "end_warning", "chance": 100, "end": "Учитель дал вам предупреждение."}}
	]
  },
  "meeting": {
	"text": ["Какая важная встреча может быть важнее урока?"],
	"options": [
	  {"text": "Семейная встреча.", "params": {"next": "family_meeting", "chance": 100}},
	  {"text": "Встреча с врачом.", "params": {"next": "doctor_meeting", "chance": 100}}
	]
  },
  "family_meeting": {
	"text": ["Семья важна, но учеба тоже."],
	"options": [
	  {"text": "Понимаю, постараюсь больше не пропускать.", "params": {"next": "end_warning", "chance": 100, "end": "Учитель дал вам предупреждение."}}
	]
  },
  "doctor_meeting": {
	"text": ["Встреча с врачом? Надеюсь, ничего серьезного."],
	"options": [
	  {"text": "Нет, просто проверка.", "params": {"next": "end_good", "chance": 100, "end": "Учитель понял и отпустил вас."}},
	  {"text": "Да, было важно.", "params": {"next": "end_good", "chance": 100, "end": "Учитель понял и отпустил вас."}}
	]
  },
  "end_warning": {
	"text": ["Учитель дал вам предупреждение."],
	"options": [],
	"end_type": "neutral"
  },
  "end_bad": {
	"text": ["Учитель заставил вас прийти на урок."],
	"options": [],
	"end_type": "lose"
  },
  "end_good": {
	"text": ["Учитель понял и отпустил вас."],
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
var text = preload("res://scenes/uielements/dialog4/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog5.tscn"

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
		Global.level4_completed = true
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

