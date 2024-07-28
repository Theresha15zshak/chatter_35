class_name DialogData

var icon:Texture
var title:String
var description:String
var states:Dictionary = {}

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
		
		func _init(_text: String, _next_state_id: String, _chance: float = 1.0):
			text = _text
			next_state_id = _next_state_id
			chance = _chance

class OptionDialogState:
	extends DialogState
	
	var options:Array
	
	func _init(text: Array, _options: Array).(text):
		options = _options
		
	func get_option(id: int)->AnswerOption:
		return options[id - 1]
		
	## Returns next dialog state id or null if selecting does not succeeded	
	func select_option(id: int):
		var option = get_option(id)
		if option.chance < 1.0 && randf() >= option.chance:
			return null
		return option.next_state_id

class EndDialogState:
	extends DialogState
	
	var result: int
	
	func _init(text: Array, _result: int).(text):
		result = _result
		
class DialogStatesBuilder:
	var data:DialogData
	## String or null
	var currentStateId = null
	var currentStateText: Array = []
	var currentOptions:Array = []
	
	func _init(_data: DialogData):
		data = _data
		
	func _endOptionStateBuilding():
		if len(currentOptions) == 0 || len(currentStateText) == 0:
			return
		data.states[currentStateId] = OptionDialogState.new(
			currentStateText, currentOptions
		)
		currentOptions = []
	
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
		
	func addOption(text: String, next_state_id: String, chance: float = 1.0)->DialogStatesBuilder:
		currentOptions.append(AnswerOption.new(
			text, next_state_id, chance
		))
		return self
	
	## text should be a String or an Array of Strings
	func addEndState(id: String, text, result: int)->DialogStatesBuilder:
		_endOptionStateBuilding()
		_setCurrentStateText(text)
		data.states[id] = EndDialogState.new(
			currentStateText, result
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
