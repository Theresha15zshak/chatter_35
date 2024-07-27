const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_collector.png")

var data:DialogData = DialogData.new(
	icon,
	"Коллектор",
	"Уклонись от коллектора"
).buildStates().addStartStateWithMultipleText(
	["Здравствуйте, откройте!", "Надо поговорить."]
).addOption(
	"(промолчать)", "silent"
).addOption(
	"Вы наверное ошиблись", "error"
).addOption(
	"Я не буду открывать", "nopen"
).addOptionState( # silent
	"silent", "Похоже придется выбивать дверь"
).addOption(
	"(Понадеется что дверь не выбьют)", "silent2", 0.2
).addOption(
	"Если выбьешь дверь, я достану оружие", "end_good", 0.6
).addOptionState( # silent2
	"silent2", "Надо позвать ребят. Эй, открой дверь, а то хуже будет."
).addOption(
	"(Молчать)", "silent3"
).addOptionState( # silent3
	"silent3", "Похоже здесь никого нет"
).addOption(
	"(Молчать)", "end_good"
).addOptionState( # error
	"error", "Нет, все верно, тот адрес"
).addOption(
	"Вам будет хуже, если вы узнаете, что это не тот адрес.", "end_good", 0.67
).addOptionState( # nopen
	"nopen", "Открой иначе у тебя будут проблемы!"
).addOption(
	"Я не буду открывать!", "nopen2"
).addOptionState( # nopen2
	"nopen2", "Открой! Сейчас мои ребята подойдут"
).addOption(
	"Ладно, открываю", "end_bad"
).addOption(
	"Я позвоню в полицию!", "end_good"
).addOption(
	"Давай зови их", "end_bad2"
).addEndState( # end_bad
	"end_bad", "А теперь пора отдавать долги", DialogData.EndResult.Lose
).addEndState( # end_bad2
	"end_bad2", "Сейчас они придут", DialogData.EndResult.Lose
).addEndState( # end_good
	"end_good", "Ладно, наверное мне стоит уйти", DialogData.EndResult.Win
).addEndState( # end_good2
	"end_good2", "Коллектор ушел. Теперь вы можете продолжать спокойно жить", DialogData.EndResult.Win
).addEndState( # end_good3
	"end_good3", "Коллектор понял, что ошибся адресом и ушел. Теперь вы можете продолжать спокойно жить", DialogData.EndResult.Win
).addEndState( # end_good4
	"end_good4", "Коллектор понял, что ошибся адресом и ушел. Теперь вы можете продолжать спокойно жить", DialogData.EndResult.Win
).endStateBuilding()
