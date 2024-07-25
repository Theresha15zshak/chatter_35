extends Control
signal answers_ended
signal animation_ended
var dialog_json = {
	"start": {
		"text": ["Почему ты не на уроке!?","Я тебя уже заждался!!"],
		"options": [
			{"text": "(промолчать риск)", "params": {"next": "silent", "chance": 38, "endF": "Учитель пишет вашей маме"}},
			{"text": "Я заболел", "params": {"next": "flew", "chance": 100}},
			{"text": "Мама сказала, что сегодня не будет урока", "params": {"next": "no_urok", "chance": 100}}
		]
	},
	"silent": {
		"text": ["Видимо он не в городе."],
		"options": [
			{"text": "(продолжить)", "params": {"next": "end_good", "chance": 100}}
		]
	},
	"flew": {
		"text": ["Правда? И чем же ты таким заболел?"],
		"options": [
			{"text": "Простудой", "params": {"next": "flew1_1", "chance": 100}},
			{"text": "Нуу опасным заболеванием гипо, как то там", "params": {"next": "end_bad", "chance": 100, "endF": "Учитель вам не поверил и доложил об этом"}},
			{"text": "Болит голова, тошнит.", "params": {"next": "flew2_1", "chance": 100}}
		]
	},
	"flew1_1": {
		"text": ["Простудой? Так прийди в маске."],
		"options": [
			{"text": "Ладно", "params": {"next": "end_bad", "chance": 100, "endF": "Учитель заставил вас прийти на урок и оштрафовал"}}
		]
	},
	"flew2_1": {
		"text": ["Хмм наверное тебе не стоит приходить на урок"],
		"options": [
			{"text": "Хорошо", "params": {"next": "end_good", "chance": 100, "end": "Учитель вам поверил. Теперь вам не нужно идти на урок."}}
		]
	},
	"no_urok": {
		"text": ["Давай я тогда сейчас напишу твоей маме"],
		"options": [
			{"text": "Она сейчас на работе и не может ответить", "params": {"next": "end_good", "chance": 30, "end": "Учитель вам поверил и не написал маме", "endF": "Учитель вам не поверил и написал маме"}}
		]
	},
	"end_bad": {
		"text": ["Приходи на урок"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad2": {
		"text": ["Учитель заставил вас прийти на урок и оштрафовал"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad3": {
		"text": ["Учитель вам не поверил и написал маме"],
		"options": [],
		"end_type": "lose"
	},
	"end_good": {
		"text": ["Можешь не приходить на занятие"],
		"options": [],
		"end_type": "win"
	},
	"end_good2": {
		"text": ["Учитель вам поверил и не написал маме"],
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

onready var Scroller := $MarginContainer/VBoxContainer/ScrollContainer
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
		Global.unlock_level(5)
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
	yield(get_tree().create_timer(0.001), "timeout")
	scroll()
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
	yield(get_tree().create_timer(0.001), "timeout")
	scroll()
	if chance <= get_cahnce:
		show_dialog(dialog_id_to_show)
	else:
		_func_game_end_screen("lose")

func scroll():
	var SC = Scroller as ScrollContainer
	SC.set_v_scroll(SC.get_v_scroll() + 100)
	print("Scroll_", "   ",SC.get_instance_id())


func _on_button_pressed():
	# Declaring chance and adding text
	hide_buttons()
	
	var chance = randi() % 100+1
	var index_i = 0
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])
	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])

func _on_button_2_pressed():
	# Declaring chance and adding text
	hide_buttons()
	
	var chance = randi() % 100+1
	var index_i = 1
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])

	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])
func _on_button_3_pressed():
	# Declaring chance and adding text
	hide_buttons()
	
	
	var chance = randi() % 100+1
	var index_i = 2
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])

	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])


func _on_button_4_pressed():
	# Declaring chance and adding text
	hide_buttons()
	
	var chance = randi() % 100+1
	var index_i = 3
	var text_answer_player = text_answer.instance() 
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(text_answer_player)
	text_answer_player.change_text(options[index_i]["text"])

	
	next_action(chance, options[index_i]["params"]["chance"], options[index_i]["params"]["next"])



func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")

