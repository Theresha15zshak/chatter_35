class_name DialogData

var icon:Texture
var title:String
var description:String
var states:Dictionary = {}
## String or null
var default_lose_screen_text

func _init(_icon: Texture, _title: String, _description: String):
	icon = _icon
	title = _title
	description = _description
	
func buildStates()->DialogStatesBuilder:
	return DialogStatesBuilder.new(self)

enum EndResult {
	Win, Lose
}

class DialogState:
	var text:Array
	
	func _init(_text: Array):
		text = _text

class AnswerOption:
		var text:String
		var next_state_id:String
		var chance:float
		## String or null
		var on_fail_state_id
		
		## on_fail_state_id should be a String or null
		func _init(_text: String, _next_state_id: String, _chance: float, on_fail_state_id):
			text = _text
			next_state_id = _next_state_id
			chance = _chance
			self.on_fail_state_id = on_fail_state_id

class OptionDialogState:
	extends DialogState
	
	var options:Array
	
	func _init(text: Array, _options: Array).(text):
		options = _options
		
	func get_option(id: int)->AnswerOption:
		return options[id - 1]
		
	## Returns next dialog state id or null if selecting does not succeeded
	## and there is no on_fail_state_id
	func select_option(id: int):
		var option = get_option(id)
		if option.chance < 1.0 && randf() >= option.chance:
			return option.on_fail_state_id
		return option.next_state_id

class EndDialogState:
	extends DialogState
	
	var result:int
	## String or null
	var end_screen_text
	
	## end_screen_text should be a String or null
	func _init(text: Array, _result: int, end_screen_text = null).(text):
		result = _result
		self.end_screen_text = end_screen_text
		
class DialogStatesBuilder:
	var data:DialogData
	## String or null
	var currentStateId = null
	var currentStateText: Array = []
	var currentOptions:Array = []
	## String or null
	var default_win_screen_text
	
	func _init(_data: DialogData):
		data = _data
		
	func _endOptionStateBuilding():
		if len(currentOptions) == 0 || len(currentStateText) == 0:
			return
		data.states[currentStateId] = OptionDialogState.new(
			currentStateText, currentOptions
		)
		currentOptions = []
		
	func setDefaultWinScreenText(text: String)->DialogStatesBuilder:
		default_win_screen_text = text
		return self
		
	func setDefaultLoseScreenText(text: String)->DialogStatesBuilder:
		data.default_lose_screen_text = text
		return self
	
	## text should be a String or an Array of Strings
	func addStartState(text)->DialogStatesBuilder:
		_setCurrentStateText(text)
		currentStateId = "start"
		return self
	
	## text should be a String or an Array of Strings
	func addOptionState(id: String, text)->DialogStatesBuilder:
		_endOptionStateBuilding()
		_setCurrentStateText(text)
		currentStateId = id
		return self
		
	## on_fail_state_id should be a String or null
	func addOption(
		text: String, next_state_id: String, chance: float = 1.0,
		on_fail_state_id = null
	)->DialogStatesBuilder:
		currentOptions.append(AnswerOption.new(
			text, next_state_id, chance, on_fail_state_id
		))
		return self
	
	## text should be a String or an Array of Strings,
	## end_screen_text should be a String or null
	func addEndState(id: String, text, result: int, end_screen_text = null)->DialogStatesBuilder:
		_endOptionStateBuilding()
		_setCurrentStateText(text)
		
		var default_end_screen_text
		match result:
			EndResult.Win:
				default_end_screen_text = default_win_screen_text
			EndResult.Lose:
				default_end_screen_text = data.default_lose_screen_text
		if default_end_screen_text != null && end_screen_text == null:
			end_screen_text = default_end_screen_text
		
		data.states[id] = EndDialogState.new(
			currentStateText, result, end_screen_text
		)
		return self
		
	func _setCurrentStateText(text):
		if text is Array:
			currentStateText = text
		elif text is String:
			currentStateText = [text]
		else:
			push_error("Invalid type of " + text 
				+ ", it should be Array or String but it is "
				+ typeof(text))
		
	func endStateBuilding()->DialogData:
		return data
