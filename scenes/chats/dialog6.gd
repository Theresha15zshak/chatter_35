extends Control
var dialog_json = {
  "start": {
	"text": "Это ограбление! Давай сюда кошелек и телефон! Иначе ножом тебя.",
	"options": {
	  "Вот берите(Отдать кошелек и телефон)": {"var": "give", "chance": 100},
	  "Попробуй догони меня(Убежать)": {"var": "run", "chance": 100},
	  "Давай попробуй!(Дать бой)": {"var": "fight", "chance": 100},
	  "Тебе не стоит меня грабить": {"var": "talk", "chance": 100}
	}
  },
  "give": {
	"text": "Вали отсюда теперь",
	"options": {
	  "Ухожу!": {"var": "end_bad", "chance": 100, "endF":"У вас все украли"}
	}
  },
  "run": {
	"text": "Эй , а ну иди сюда!",
	"options": {
	  "Бежать дальше(Риск)": {"var": "end_good", "chance": 50, "end":"У вас получилось убежать", "endF":"Бандит вас догнал"},
	  "Бандит догоняет вас и угрожает.(Риск)": {"var": "caught", "chance": 100}
	}
  },
  "caught": {
	"text": "Попался! Теперь ты у меня запаешь ,жмур. А ну ка давай вещи, а то дам по лицу.",
	"options": {
	  "Отдать кошелек и телефон": {"var": "give", "chance": 100},
	  "(Попытаться выбраться и снова убежать)": {"var": "run_again", "chance": 99}
	}
  },
  "run_again": {
	"text": "Ну все, доигрался теперь ты труп!",
	"options": {
	  "(Попробовать убежать)": {"var": "end_bad", "chance": 25, "end":"У вас получилось убежать", "endF":"Бандит вас догнал"}
	}
  },
  "fight": {
	"text": "Сейчас ты запоешь у меня!",
	"options": {
	  "(Дратся с бандитом риск)": {"var": "end_good", "chance": 25, "end":"У вас получилось победить бандита в бою", "endF":"Бандиту получилось вас победить"},
	}
  },
  "talk": {
	"text": "Да? А с чего это?",
	"options": {
	  "Тут везде полиция, я на тебя доложу и тебя сразу же посадят. Если убьеш то сядешь на всю жизнь": {"var": "talk_success", "chance": 30},
	  "У меня крыша из твоих братков, Юра меня крышует": {"var": "end_good", "chance": 30, "end":"Бандит испугался вашей крыши и теперь вы в безопастности", "endF":"Бандит не поверил вам"},
	  "У меня крыша их твоих братков, Андрюха меня крышует": {"var": "end_good", "chance": 100, "end":"Бандит испугался вашей крыши и теперь вы в безопастности"}
	}
  },
  "talk_success": {
	"text": "Наверное ты прав, давай вали отсюда.",
	"options": {
	  "(Убежать)": {"var": "end_good", "chance": 100, "end":"Вы смогли убедить бандита, что ему не стоит вас грабить"}
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
var text = preload("res://scenes/uielements/dialog6/controltext.tscn")
var text2 = preload("res://scenes/uielements/controltext_rotated.tscn")
var animation = preload("res://scenes/uielements/animation.tscn")


const next_level = "res://scenes/chats/dialog7.tscn"

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
			Global.level6_completed = true
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
			Global.level6_completed = true
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
			Global.level6_completed = true
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
			Global.level6_completed = true
		show_dialog(options[options.keys()[3]]["var"]) 
		
	else:
		_func_game_over_screen()
