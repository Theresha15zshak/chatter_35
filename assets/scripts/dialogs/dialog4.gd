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
	"(промолчать, риск)", "silent", 0.5, "end_bad4"
).addOption(
	"Я заболел", "sick"
).addOption(
	"Мама сказала, что сегодня не будет урока", "no_urok"
).addOption(
	"Общественный транспорт задержался", "public_transport_delay"
).addOptionState(
	"silent", "Видимо, он не в городе."
).addOption(
	"(продолжить молчать)", "end_good", 0.7, "end_bad"
).addOption(
	"(начать придумывать оправдание)", "begin_excuse"
).addOption(
	"(извиниться и попытаться уйти)", "apologize_leave", 0.3, "end_bad2"
).addOptionState(
	"begin_excuse", "Учитель ждет объяснений."
).addOption(
	"Извините, я забыл, что сегодня урок", "forget_class"
).addOption(
	"Мне стало плохо по пути сюда", "sick", 0.4, "end_bad2"
).addOption(
	"У меня срочные дела дома", "urgent_home"
).addOptionState(
	"forget_class", "Как можно было забыть о таком важном уроке?!"
).addOption(
	"Это больше не повторится", "end_bad3"
).addOption(
	"Постараюсь компенсировать пропущенное", "compensate"
).addOptionState(
	"compensate", "Как именно ты планируешь компенсировать пропущенное?"
).addOption(
	"Могу сделать дополнительное задание", "end_good2"
).addOption(
	"Запишусь на дополнительные занятия", "end_good"
).addOptionState(
	"sick", "Правда? И чем же ты таким заболел?"
).addOption(
	"Простудой", "sick1"
).addOption(
	"Болит голова тошнит", "sick2"
).addOptionState(
	"sick1", "Простудой? Так прийди в маске."
).addOption(
	"Ладно", "end_bad"
).addOption(
	"У меня нет маски", "end_good"
).addOptionState(
	"sick2", "Хмм, наверное тебе не стоит приходить на урок"
).addOption(
	"Хорошо, спасибо за понимание", "end_good"
).addOptionState(
	"no_urok", "Давай я тогда сейчас напишу твоей маме"
).addOption(
	"Она сейчас на работе и не сможет ответить", "end_good2", 0.3, "end_bad3"
).addOption(
	"Подождите, я сам позвоню", "call_mom"
).addOptionState(
	"call_mom", "Звони."
).addOption(
	"Мама сказала, что ошиблась", "end_bad"
).addOption(
	"Мама сказала, что нужно остаться дома", "end_good2"
).addOptionState(
	"public_transport_delay", "Долго ждал автобуса или поезда?"
).addOption(
	"Да, это заняло больше времени, чем ожидалось", "end_good"
).addOption(
	"Да, были задержки на линии", "end_good2"
).addEndState(
	"end_bad", "Приходи на урок", DialogData.EndResult.Lose
).addEndState(
	"end_bad2", "(Учитель заставил вас прийти на урок и оштрафовал)", DialogData.EndResult.Lose
).addEndState(
	"end_bad3", "(Учитель вам не поверил и написал маме)", DialogData.EndResult.Lose
).addEndState(
	"end_bad4", "(Учитель решил написать вашей маме)", DialogData.EndResult.Lose
).addEndState(
	"end_good", "Можешь не приходить на занятие", DialogData.EndResult.Win
).addEndState(
	"end_good2", "Учитель вам поверил и не написал маме", DialogData.EndResult.Win
).endStateBuilding()





