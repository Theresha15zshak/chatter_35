extends Control
signal answers_ended
signal animation_ended
var dialog_json = {
	"start": {
		"text": ["Вы в древней пещере. Ваша цель - найти золото."],
		"options": [
			{"text": "Продолжить", "params": {"next": "start1", "chance": 100}}
		]
	},
	"start1": {
		"text": ["Перед вами три прохода: комната с рычагом, к призракам и к мосту. Куда пойдете?"],
		"options": [
			{"text": "комната с рычагом", "params": {"next": "left", "chance": 100}},
			{"text": "к призракам", "params": {"next": "right", "chance": 100}},
			{"text": "к мосту", "params": {"next": "straight", "chance": 100}}
		]
	},
	"left": {
		"text": ["Левая дверь ведет в комнату с рычагом. Что сделаете?"],
		"options": [
			{"text": "Потянуть за рычаг", "params": {"next": "lever", "chance": 100}},
			{"text": "Вернуться", "params": {"next": "start", "chance": 100}}
		]
	},
	"lever": {
		"text": ["Пол проваливается. Оставаться здесь опасно. Идти на звук шагов или ждать?"],
		"options": [
			{"text": "Идти на звук шагов", "params": {"next": "steps", "chance": 100}},
			{"text": "Ждать", "params": {"next": "end_bad1", "chance": 100}}
		]
	},
	"steps": {
		"text": ["Вы видите старика, который предлагает помощь. Поверить ему?"],
		"options": [
			{"text": "Поверить", "params": {"next": "follow_old_man", "chance": 100}},
			{"text": "Отказаться", "params": {"next": "end_bad2", "chance": 100}}
		]
	},
	"follow_old_man": {
		"text": ["Старик ведет вас к статуе. Нужно решить головоломку. Попытаться решить?"],
		"options": [
			{"text": "Решить головоломку", "params": {"next": "puzzle", "chance": 100}},
			{"text": "Попробовать открыть силой", "params": {"next": "end_bad3", "chance": 100}}
		]
	},
	"puzzle": {
		"text": ["Руны: 'Сила воды превыше огня'. Выберите правильный порядок."],
		"options": [
			{"text": "Вода-Огонь-Земля-Воздух", "params": {"next": "end_good", "chance": 100}},
			{"text": "Огонь-Вода-Воздух-Земля", "params": {"next": "end_bad4", "chance": 100}}
		]
	},
	"right": {
		"text": ["Перед вами два призрака. 'Что не имеет начала и конца?'"],
		"options": [
			{"text": "Кольцо", "params": {"next": "ring", "chance": 100}},
			{"text": "Время", "params": {"next": "end_bad5", "chance": 100}}
		]
	},
	"ring": {
		"text": ["Призраки исчезают, открывая путь к золоту."],
		"options": [
			{"text": "Подобрать золото", "params": {"next": "n_go", "chance": 100}},
			{"text": "Оставить золото", "params": {"next": "end_bad6", "chance": 100}}
		]
	},
	"straight": {
		"text": ["Перед вами подземная река с хрупким мостом. Что сделать?"],
		"options": [
			{"text": "Перейти мост", "params": {"next": "cross_bridge", "chance": 100}},
			{"text": "Искать другой путь", "params": {"next": "find_path", "chance": 100}}
		]
	},
	"cross_bridge": {
		"text": ["Вы переходите мост и видите золотую дверь."],
		"options": [
			{"text": "Открыть дверь", "params": {"next": "golden_door", "chance": 100}},
			{"text": "Вернуться", "params": {"next": "start", "chance": 100}}
		]
	},
	"find_path": {
		"text": ["Вы находите лодку и переплываете реку. 'Что принадлежит вам, но другие используют чаще?'"],
		"options": [
			{"text": "Имя", "params": {"next": "end_good", "chance": 100}},
			{"text": "Тень", "params": {"next": "end_bad7", "chance": 100}}
		]
	},
	"golden_door": {
		"text": ["Дверь открывается, вы видите сокровища."],
		"options": [
			{"text": "Подобрать золото", "params": {"next": "n_go", "chance": 100}},
			{"text": "Закрыть дверь", "params": {"next": "start", "chance": 100}}
		]
	},
	"n_go": {
		"text": ["Начинается землетрясение. Оставаться здесь опасно. Ваши действия?"],
		"options": [
			{"text": "Создать гранату", "params": {"next": "end_bad8", "chance": 100}},
			{"text": "Бежать", "params": {"next": "n_go2", "chance": 100}},
			{"text": "Ждать помощи", "params": {"next": "end_bad9", "chance": 100}}
		]
	},
	"n_go2": {
		"text": ["Выход заблокирован кодовой панелью: 'X---'. После X следует Y, после Y — X."],
		"options": [
			{"text": "XYXY", "params": {"next": "end_good", "chance": 100}},
			{"text": "XXYX", "params": {"next": "end_bad10", "chance": 100}},
			{"text": "XYYX", "params": {"next": "end_bad10", "chance": 100}}
		]
	},
	"end_bad1": {
		"text": ["Пол под вами провалился и вы умерли"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad2": {
		"text": ["У вас нет способа спастись и вы умираете"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad3": {
		"text": ["Решение силой не привело к чему-либо хорошему"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad4": {
		"text": ["Вы решили загадку неправильно и теперь ваша судьба не завидна"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad5": {
		"text": ["Вы ошиблись и теперь ваша судьба не завидна"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad6": {
		"text": ["Вы остались без сокровищ и не достигли своей цели"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad7": {
		"text": ["Вы проиграли и теперь ваша участь не завидна"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad8": {
		"text": ["Граната подрывает все и убивает вас"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad9": {
		"text": ["Вы остались ждать помощи, но никто вам не помог и теперь ваша участь не завидна"],
		"options": [],
		"end_type": "lose"
	},
	"end_bad10": {
		"text": ["Вы решили загадку неправильно и теперь ваша судьба не завидна"],
		"options": [],
		"end_type": "lose"
	},
	"end_good": {
		"text": ["Вы решили загадку правильно и теперь вы спасены"],
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
var text = preload("res://scenes/uielements/dialog2/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/chats/dialog3.tscn"

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
