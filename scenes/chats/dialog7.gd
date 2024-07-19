extends Control
signal answers_ended
signal animation_ended
var dialog_json = {
	"start": {
		"text": ["Здравствуйте!"],
		"options": [
			{"text": "Здравствуйте, я хочу повышение.", "params": {"next": "start2", "chance": 100}}
		]
	},
	"start2": {
		"text": ["Почему вы считаете, что заслуживаете повышения?"],
		"options": [
			{"text": "Я хорошо показал себя в прошлом месяце и долго работаю в компании.", "params": {"next": "goodwork", "chance": 100}},
			{"text": "Я принес компании большую прибыль своей работой.", "params": {"next": "moneyzs", "chance": 100}},
			{"text": "Мне нужно повышение, иначе я уйду, так как я ценный сотрудник.", "params": {"next": "end_good1", "chance": 59, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}}
		]
	},
	"goodwork": {
		"text": ["Да, но этого недостаточно для повышения."],
		"options": [
			{"text": "Я очень хороший работник, благодаря мне была настроена работа команды.", "params": {"next": "goodwork_team", "chance": 100}},
			{"text": "Я приношу неплохую прибыль!", "params": {"next": "goodwork_money", "chance": 100}},
			{"text": "Я выполняю много задач и всегда готов помочь.", "params": {"next": "dedication", "chance": 100}}
		]
	},
	"goodwork_team": {
		"text": ["Это не только ваша заслуга. Начальник сыграл большую роль."],
		"options": [
			{"text": "Разве этого уже не достаточно, чтобы повысить меня?", "params": {"next": "end_good2", "chance": 75, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Без моей помощи, команда не достигла бы таких результатов.", "params": {"next": "team_success", "chance": 100}}
		]
	},
	"team_success": {
		"text": ["Ваш вклад значителен, но повышение требует более веских оснований."],
		"options": [
			{"text": "Я также обучал новых сотрудников и внедрил эффективные методы работы.", "params": {"next": "training", "chance": 100}},
			{"text": "Я разработал систему, которая улучшила продуктивность.", "params": {"next": "productivity_system", "chance": 100}}
		]
	},
	"training": {
		"text": ["Это действительно ценно. Обучение новых сотрудников важно для компании."],
		"options": [
			{"text": "Так почему бы не повысить меня за мои усилия?", "params": {"next": "end_good3", "chance": 85, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Я также организовал тренинги, которые улучшили навыки команды.", "params": {"next": "trainings", "chance": 100}}
		]
	},
	"trainings": {
		"text": ["Это впечатляет. Но нам нужно больше времени, чтобы оценить результаты."],
		"options": [
			{"text": "Я готов ждать и продолжать работать на благо компании.", "params": {"next": "end_good4", "chance": 70, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Мои усилия уже принесли видимые результаты.", "params": {"next": "visible_results", "chance": 100}}
		]
	},
	"visible_results": {
		"text": ["Ваша работа действительно заметна. Мы рассмотрим ваше повышение."],
		"options": [
			{"text": "Спасибо за понимание.", "params": {"next": "end_good5", "chance": 90, "end": "Начальник вам поверил и рассматривает ваше повышение", "endF": "Начальник вам не поверил"}}
		]
	},
	"goodwork_money": {
		"text": ["Прибыль важна, но не является единственным фактором."],
		"options": [
			{"text": "Я также внедрил эффективные методы работы, которые улучшили производительность.", "params": {"next": "productivity_methods", "chance": 100}},
			{"text": "Я всегда готов помочь коллегам и поддерживать команду.", "params": {"next": "team_support", "chance": 100}}
		]
	},
	"productivity_methods": {
		"text": ["Это хороший аргумент. Мы ценим ваши усилия."],
		"options": [
			{"text": "Благодаря моим методам, компания сэкономила много времени и ресурсов.", "params": {"next": "time_saving", "chance": 100}},
			{"text": "Я могу продолжать улучшать процессы в компании.", "params": {"next": "process_improvement", "chance": 100}}
		]
	},
	"time_saving": {
		"text": ["Экономия времени и ресурсов - это всегда плюс."],
		"options": [
			{"text": "Так почему бы не повысить меня за мои достижения?", "params": {"next": "end_good6", "chance": 80, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Я также готов предложить новые идеи для дальнейшего улучшения.", "params": {"next": "new_ideas", "chance": 100}}
		]
	},
	"new_ideas": {
		"text": ["Ваш энтузиазм вдохновляет. Мы рассмотрим ваше предложение."],
		"options": [
			{"text": "Спасибо за возможность!", "params": {"next": "end_good7", "chance": 90, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}}
		]
	},
	"team_support": {
		"text": ["Поддержка команды важна, но что еще вы можете предложить?"],
		"options": [
			{"text": "Я обучал новых сотрудников и внедрял новые процессы.", "params": {"next": "training", "chance": 100}},
			{"text": "Я разработал систему для улучшения продуктивности.", "params": {"next": "productivity_system", "chance": 100}}
		]
	},
	"productivity_system": {
		"text": ["Эффективные системы работы всегда ценны."],
		"options": [
			{"text": "Благодаря этой системе, работа стала более организованной.", "params": {"next": "organized_work", "chance": 100}},
			{"text": "Система помогла улучшить качество работы всей команды.", "params": {"next": "team_quality", "chance": 100}}
		]
	},
	"organized_work": {
		"text": ["Организация работы - ключ к успеху."],
		"options": [
			{"text": "Так почему бы не повысить меня за эти усилия?", "params": {"next": "end_good8", "chance": 85, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}}
		]
	},
	"team_quality": {
		"text": ["Улучшение качества работы команды - это весомый аргумент."],
		"options": [
			{"text": "Спасибо за признание моих усилий!", "params": {"next": "end_good9", "chance": 90, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}}
		]
	},
	"moneyzs": {
		"text": ["Прибыль важна, но нужно быть не только прибыльным."],
		"options": [
			{"text": "Я также неплохо сработался с командой.", "params": {"next": "teamwork", "chance": 100}},
			{"text": "Деньги решают многое в бизнесе.", "params": {"next": "money_talks", "chance": 100}}
		]
	},
	"teamwork": {
		"text": ["Хорошие отношения в команде важны."],
		"options": [
			{"text": "Я помогаю коллегам и способствую развитию компании.", "params": {"next": "end_good10", "chance": 80, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Благодаря моим усилиям, работа команды улучшилась.", "params": {"next": "team_improvement", "chance": 100}}
		]
	},
	"team_improvement": {
		"text": ["Улучшение работы команды - это значительный вклад."],
		"options": [
			{"text": "Спасибо за внимание к моим достижениям!", "params": {"next": "end_good11", "chance": 90, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}}
		]
	},
	"money_talks": {
		"text": ["Деньги решают многое, но не всё."],
		"options": [
			{"text": "Я также внедрил новые методы работы для повышения эффективности.", "params": {"next": "efficiency_methods", "chance": 100}},
			{"text": "Мои усилия помогают компании расти.", "params": {"next": "company_growth", "chance": 100}}
		]
	},
	"efficiency_methods": {
		"text": ["Эффективность важна для любой компании."],
		"options": [
			{"text": "Благодаря моим методам, мы достигли значительных успехов.", "params": {"next": "end_good12", "chance": 85, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Я могу продолжать улучшать наши процессы.", "params": {"next": "process_improvement", "chance": 100}}
		]
	},
	"company_growth": {
		"text": ["Рост компании - это всегда хорошо."],
		"options": [
			{"text": "Так почему бы не повысить меня за мой вклад?", "params": {"next": "end_good13", "chance": 80, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Я готов предложить новые идеи для дальнейшего роста.", "params": {"next": "new_ideas", "chance": 100}}
		]
	},
	"dedication": {
		"text": ["Ваше стремление помогать ценно для нас."],
		"options": [
			{"text": "Я также участвую в разработке новых проектов.", "params": {"next": "new_projects", "chance": 100}},
			{"text": "Я всегда готов работать сверхурочно для достижения целей.", "params": {"next": "overtime", "chance": 100}}
		]
	},
	"new_projects": {
		"text": ["Новые проекты важны для развития компании."],
		"options": [
			{"text": "Мои проекты уже показали хорошие результаты.", "params": {"next": "end_good14", "chance": 85, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Я могу предложить еще больше новых идей.", "params": {"next": "new_ideas", "chance": 100}}
		]
	},
	"overtime": {
		"text": ["Работа сверхурочно - это большой плюс."],
		"options": [
			{"text": "Я готов работать еще усерднее, если получу повышение.", "params": {"next": "end_good15", "chance": 75, "end": "Начальник вам поверил", "endF": "Начальник вам не поверил"}},
			{"text": "Мои усилия уже приносят пользу компании.", "params": {"next": "visible_results", "chance": 100}}
		]
	},
	"end_good1": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good2": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good3": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good4": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good5": {
		"text": ["Начальник вам поверил и рассматривает ваше повышение"],
		"options": [],
		"end_type": "win"
	},
	"end_good6": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good7": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good8": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good9": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good10": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good11": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good12": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good13": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good14": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_good15": {
		"text": ["Начальник вам поверил"],
		"options": [],
		"end_type": "win"
	},
	"end_bad": {
		"text": ["Начальник вам не поверил"],
		"options": [],
		"end_type": "lose"
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
var text = preload("res://scenes/uielements/dialog7/controltext.tscn")
var text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")

const next_level = "res://scenes/controlmenu.tscn"

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
		Global.level7_completed = true
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
