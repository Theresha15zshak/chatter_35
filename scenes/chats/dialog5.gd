extends Control
signal answers_ended
signal animation_ended
var dialog_json = {
	"start": {
		"text": ["Здравствуйте, откройте!","Надо поговорить."],
		"options": [
			{"text": "(промолчать)", "params": {"next": "silent", "chance": 100}},
			{"text": "Вы наверное ошиблись", "params": {"next": "error", "chance": 100}},
			{"text": "Я не буду открывать", "params": {"next": "nopen", "chance": 100}}
		]
	},
	"silent": {
		"text": ["Похоже придется выбивать дверь"],
		"options": [
			{"text": "(Понадеется что дверь не выбьют)", "params": {"next": "silent2", "chance": 20}},
			{"text": "Если выбьешь дверь, я достану оружие", "params": {"next": "end_good", "chance": 60, "end": "Коллектор вам поверил и ушел. Теперь вы можете продолжать спокойно жить", "endF": "Коллектор не поверил вам и выбил дверь."}}
		]
	},
	"silent2": {
		"text": ["Надо позвать ребят. Эй, открой дверь, а то хуже будет."],
		"options": [
			{"text": "(Молчать)", "params": {"next": "silent3", "chance": 100}}
		]
	},
	"silent3": {
		"text": ["Похоже здесь никого нет"],
		"options": [
			{"text": "(Молчать)", "params": {"next": "end_good", "chance": 100, "end": "Коллектор ушел. Теперь вы можете продолжать спокойно жить"}}
		]
	},
	"error": {
		"text": ["Нет, все верно, тот адрес"],
		"options": [
			{"text": "Вам будет хуже, если вы узнаете, что это не тот адрес.", "params": {"next": "end_good", "chance": 67, "end": "Коллектор понял, что ошибся адресом и ушел. Теперь вы можете продолжать спокойно жить", "endF": "Коллектор вам не поверил и выбивает дверь"}}
		]
	},
	"nopen": {
		"text": ["Открой иначе у тебя будут проблемы!"],
		"options": [
			{"text": "Я не буду открывать!", "params": {"next": "nopen2", "chance": 100}}
		]
	},
	"nopen2": {
		"text": ["Открой! Сейчас мои ребята подойдут"],
		"options": [
			{"text": "Ладно, открываю", "params": {"next": "end_bad", "chance": 100, "endF": "Коллектор выбивает дверь и возникают проблемы"}},
			{"text": "Я позвоню в полицию!", "params": {"next": "end_good", "chance": 100, "end": "Коллектор понял, что ошибся адресом и ушел. Теперь вы можете продолжать спокойно жить"}},
			{"text": "Давай зови их", "params": {"next": "end_bad2", "chance": 100, "endF": "Коллектор зовет ребят и выбивает дверь"}}
		]
	},
	"end_bad": {
		"text": ["А теперь пора отдавать долги"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad2": {
		"text": ["Сейчас они придут"],
		"options": [],
		"end_type": "lose"
	},
	"end_good": {
		"text": ["Ладно, наверное мне стоит уйти"],
		"options": [],
		"end_type": "win"
	},
	"end_good2": {
		"text": ["Коллектор ушел. Теперь вы можете продолжать спокойно жить"],
		"options": [],
		"end_type": "win"
	},
	"end_good3": {
		"text": ["Коллектор понял, что ошибся адресом и ушел. Теперь вы можете продолжать спокойно жить"],
		"options": [],
		"end_type": "win"
	},
	"end_good4": {
		"text": ["Коллектор понял, что ошибся адресом и ушел. Теперь вы можете продолжать спокойно жить"],
		"options": [],
		"end_type": "win"
	}
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
var text = preload("res://scenes/uielements/dialog5/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog6.tscn"

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
		Global.levels_unlocked += 1
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
