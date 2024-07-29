extends Node
signal answers_ended
signal animation_ended

const game_over_screen = preload("res://scenes/uielements/control_game_over.tscn")
const game_win_screen = preload("res://scenes/uielements/control_game_win.tscn")
const text = preload("res://scenes/uielements/controltext.tscn")
const text_answer = preload("res://scenes/uielements/controltext_rotated.tscn")
const animation = preload("res://scenes/uielements/animation.tscn")
const DialogData = preload("res://assets/scripts/dialog_data.gd")
const Message = preload("res://assets/scripts/text.gd")
var level_id = Global.current_level

const START_STATE_ID = "start"
	
var current_state_id:String = START_STATE_ID
var data:DialogData = Global.levels_data[level_id - 1]
var dialog:Dictionary = data.states

onready var button_texts:Array = [
	get_button_text_node(1), get_button_text_node(2),
	get_button_text_node(3), get_button_text_node(4)
]
onready var buttons:Array = [
	get_button_node(1), get_button_node(2),
	get_button_node(3), get_button_node(4)
]
onready var button_debug_texts:Array = [
	get_button_debug_info_node(1), get_button_debug_info_node(2),
	get_button_debug_info_node(3), get_button_debug_info_node(4)
]
onready var scroller:ScrollContainer = $MarginContainer/VBoxContainer/ScrollContainer
onready var scroller_vbox:VBoxContainer = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer
onready var icon_node:TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect
onready var title_node:Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label
onready var description_node:Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label2


func _ready():
	assert(level_id > 0, "Current level id is invalid. It must be over 0")	
	icon_node.texture = data.icon
	title_node.text = data.title
	description_node.text = data.description
	
	print("GOYDA")
	hide_buttons()
	add_dialog_state(START_STATE_ID)
	
func get_button_node(button_id: int, suffix: String = "")->Node:
	var container_id = ""
	if button_id > 2:
		container_id = "2"
	var inner_button_id = ""
	if button_id % 2 == 0:
		inner_button_id = "2"
	
	return get_node(
		"MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer"
		+ container_id
		+ "/control_button"
		+ inner_button_id
		+ "/Button"
		+ suffix
	)
	
func get_button_text_node(button_id: int)->Node:
	return get_button_node(button_id, "/Label")

func get_button_debug_info_node(button_id: int)->Node:
	return get_button_node(button_id, "/DebugInfoLabel")
	
func hide_buttons():
	for button in buttons:
		button.hide()
	for debug_text in button_debug_texts:
		debug_text.hide()
		
func get_button(id: int)->Node:
	return buttons[id - 1]

func add_dialog_state(state_id: String):
	var state:DialogData.DialogState = dialog[state_id]
	current_state_id = state_id
	for message in state.text:
		draw_comp_message(message)
	if state is DialogData.EndDialogState:
		draw_game_end_screen(state)
		return
	if state is DialogData.OptionDialogState:
		draw_answer_options(state.options)
	
func draw_game_end_screen(state: DialogData.EndDialogState):
	yield(get_tree().create_timer(0.861), "timeout")
	var screen_instance
	match state.result:
		DialogData.EndResult.Win:
			Global.unlock_level(level_id + 1)
			screen_instance = game_win_screen.instance()
		DialogData.EndResult.Lose:
			screen_instance = game_over_screen.instance()
	add_child(screen_instance)
	screen_instance.set_text(state.end_screen_text)
	
func play_animation(time_in_seconds):
	var animation_instance = animation.instance()
	scroller_vbox.add_child(animation_instance)
	yield(get_tree().create_timer(0.01), "timeout")
	scroll()
	# Timer for animation
	yield(get_tree().create_timer(time_in_seconds), "timeout")
	# hiding animation
	animation_instance.free()
	emit_signal("animation_ended")
	
func draw_comp_answer(t):
	var comp_dialog_text:Message = text.instance()
	scroller_vbox.add_child(comp_dialog_text)
	comp_dialog_text.set_text(t)
	comp_dialog_text.set_icon(data.icon)
	
func scroll():
	var scrollbar = scroller.get_v_scrollbar()
	scrollbar.value = scrollbar.max_value
	
func draw_answer_options(options: Array):
	yield(self, "answers_ended")
	for i in range(options.size()):
		var option:DialogData.AnswerOption = options[i]
		button_texts[i].text = option.text
		buttons[i].show()
		
		if Global.is_debug_enabled():
			var debug_text = button_debug_texts[i]
			debug_text.show()
			debug_text.text = "Next: " + option.next_state_id + "|Chance: " + str(option.chance)
	
func draw_comp_message(message):
	play_animation(0.5)
	yield(self, "animation_ended")
	draw_comp_answer(message)
	emit_signal("answers_ended")
	
func _on_button_menu_pressed():
	get_tree().change_scene("res://scenes/controlmenu.tscn")
	
func _on_button_answer_pressed(option_id: int):
	hide_buttons()
	var state:DialogData.OptionDialogState = data.states[current_state_id]
	var next_state_id = state.select_option(option_id)
	if next_state_id == null:
		var lose_screen = game_over_screen.instance()
		add_child(lose_screen)
		if data.default_lose_screen_text != null:
			lose_screen.set_text(data.default_lose_screen_text)
		return
	
	var option = state.get_option(option_id)
	var text_answer_instance:Message = text_answer.instance()
	scroller_vbox.add_child(text_answer_instance)
	text_answer_instance.set_text(option.text)
	
	add_dialog_state(next_state_id)
