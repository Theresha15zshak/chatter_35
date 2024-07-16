extends Control
signal answers_ended
signal animation_ended
var dialog_json = {
	"start": {
		"text": ["Здравствуйте! Я курьер и не могу найти ваш дом."],
		"options": [
			{"text": "Какой курьер?", "params": {"next": "what", "chance": 100}},
			{"text": "Где вы сейчас?", "params": {"next": "where", "chance": 100}}
		]
	},
	"what": {
		"text": ["Вы заказывали доставку еды на сайте."],
		"options": [
			{"text": "Вспомнил! Где вы сейчас?", "params": {"next": "where", "chance": 100}},
			{"text": "Не помню такого. Возможно, вы ошиблись.", "params": {"next": "end_bad", "chance": 100}}
		]
	},
	"where": {
		"text": ["Я возле метро, здесь все замело снегом."],
		"options": [
			{"text": "Какая станция метро?", "params": {"next": "searching", "chance": 100}},
			{"text": "Попробуйте найти дорогу через карту. (Риск)", "params": {"next": "risk_path", "chance": 36}}
		]
	},
	"searching": {
		"text": ["Станция метро Новокузнецкая."],
		"options": [
			{"text": "Пройдите через лес по тропинке, она приведет вас к двору.", "params": {"next": "forest", "chance": 100}}
		]
	},
	"forest": {
		"text": ["Я в лесу. Здесь много тропинок. Куда идти дальше?"],
		"options": [
			{"text": "Идите прямо, пока не увидите старый колодец, затем налево.", "params": {"next": "well", "chance": 100}},
			{"text": "Сверните направо на первой развилке, потом снова направо.", "params": {"next": "wrong_way", "chance": 100}}
		]
	},
	"well": {
		"text": ["Я нашел колодец. Что теперь?"],
		"options": [
			{"text": "От колодца идите налево до конца тропинки.", "params": {"next": "searching2", "chance": 100}},
			{"text": "Пройдите мимо колодца и сверните направо.", "params": {"next": "lost", "chance": 100}}
		]
	},
	"wrong_way": {
		"text": ["Я заблудился. Здесь нет выхода."],
		"options": [
			{"text": "Вернитесь к началу леса и попробуйте снова.", "params": {"next": "forest", "chance": 100}},
			{"text": "Попробуйте найти кого-то для помощи.", "params": {"next": "end_bad", "chance": 100}}
		]
	},
	"lost": {
		"text": ["Я снова потерялся. Не вижу ориентиров."],
		"options": [
			{"text": "Вернитесь к колодцу и следуйте инструкциям заново.", "params": {"next": "well", "chance": 100}},
			{"text": "Ну сделайте что-нибудь", "params": {"next": "end_bad", "chance": 100}}
		]
	},
	"searching2": {
		"text": ["Я вижу жилой район. Куда дальше?"],
		"options": [
			{"text": "Идите к большому красному зданию, затем налево.", "params": {"next": "residential", "chance": 100}},
			{"text": "Ищите 5-й подъезд в синем доме.", "params": {"next": "residential2", "chance": 100}}
		]
	},
	"residential": {
		"text": ["Я у красного здания. Где ваш дом?"],
		"options": [
			{"text": "Продолжайте идти налево до 5-го подъезда.", "params": {"next": "finded_path", "chance": 100}},
			{"text": "Вы ошиблись. Вернитесь назад.", "params": {"next": "searching2", "chance": 100}}
		]
	},
	"residential2": {
		"text": ["Я у синего дома. Нашел 5-й подъезд."],
		"options": [
			{"text": "Отлично, заходите в 5-й подъезд.", "params": {"next": "finded_path", "chance": 100}},
			{"text": "Это не тот дом.", "params": {"next": "searching2", "chance": 100}}
		]
	},
	"risk_path": {
		"text": ["Попробую использовать карту, но здесь плохая видимость."],
		"options": [
			{"text": "Осторожно следуйте указаниям карты.", "params": {"next": "searching", "chance": 100}},
			{"text": "Вернитесь к метро и попробуйте другой путь.", "params": {"next": "searching", "chance": 100}}
		]
	},
	"finded_path": {
		"text": ["Отлично, я нашел ваш дом. Скоро буду с вашей едой!"],
		"options": [
			{"text": "Отлично, жду вас!", "params": {"next": "end_good", "chance": 100}}
		]
	},
	"end_bad": {
		"text": ["Вы остались без еды."],
		"options": [],
		"end_type": "lose"
	},
	"end_good": {
		"text": ["Скоро прибудет ваша вкусная еда."],
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
var text = preload("res://scenes/uielements/dialog3/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog4.tscn"

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
		Global.level3_completed = true
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
