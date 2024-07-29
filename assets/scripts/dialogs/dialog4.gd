const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_teacher.png")

var data:DialogData = DialogData.new(
	icon,
	"Учитель",
	"Придумай как прогулять урок"
).buildStates().setDefaultWinScreenText(
	"У вас получилось прогулять урок"
).setDefaultLoseScreenText(
	"Вам пришлось прийти на урок"
).addStartState(
	["Почему ты не на уроке?!", "Я тебя уже заждался!!"]
).addOption(
	"(промолчать, риск)", "silent", 0.38, "end_bad4"
).addOption(
	"Я заболел", "flew"
).addOption(
	"Мама сказала, что сегодня не будет урока", "no_urok"
).addOptionState( # silent
	"silent", "Видимо, он не в городе."
).addOption(
	"(продолжить молчать)", "end_good"
).addOptionState( # flew
	"flew", "Правда? И чем же ты таким заболел?"
).addOption(
	"Простудой", "flew1_1"
).addOption(
	"Нуу опасным заболеванием гипо, как-то там", "end_bad3"
).addOption(
	"Болит голова, тошнит.", "flew2_1"
).addOptionState( # flew1_1
	"flew1_1", "Простудой? Так прийди в маске."
).addOption(
	"Ладно", "end_bad"
).addOptionState( # flew2_1
	"flew2_1", "Хмм, наверное тебе не стоит приходить на урок"
).addOption(
	"Хорошо", "end_good"
).addOptionState( # no_urok
	"no_urok", "Давай я тогда сейчас напишу твоей маме"
).addOption(
	"Она сейчас на работе и не сможет ответить", "end_good2", 0.3, "end_bad3"
).addEndState( # end_bad
	"end_bad", "Приходи на урок", DialogData.EndResult.Lose
).addEndState( # end_bad2
	"end_bad2", "(Учитель заставил вас прийти на урок и оштрафовал)", DialogData.EndResult.Lose
).addEndState( # end_bad3
	"end_bad3", "(Учитель вам не поверил и написал маме)", DialogData.EndResult.Lose
).addEndState( # end_bad3
	"end_bad4", "(Учитель решил написать вашей маме)", DialogData.EndResult.Lose
).addEndState( # end_good
	"end_good", "Можешь не приходить на занятие", DialogData.EndResult.Win
).addEndState( # end_good2
	"end_good2", "Учитель вам поверил и не написал маме", DialogData.EndResult.Win
).endStateBuilding()
