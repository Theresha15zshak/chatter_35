const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_collector.png")

var data:DialogData = DialogData.new(
	icon,
	"Коллектор",
	"Уклонись от коллектора"
).buildStates().setDefaultWinScreenText(
	"Коллектор не попал в вашу квартиру"
).setDefaultLoseScreenText(
	"Коллектор попал в вашу квартиру"
).addStartState(
	["Здравствуйте, откройте!", "Надо поговорить."]
).addOption(
	"(промолчать)", "silent"
).addOption(
	"Вы, наверное, ошиблись", "error"
).addOption(
	"Я не буду открывать", "nopen"
).addOption(
	"Сейчас выйду, подождите", "delay"
).addOptionState(
	"silent", "Похоже, придется выбивать дверь"
).addOption(
	"(Понадеяться, что дверь не выбьют)", "silent2", 0.2, "end_bad3"
).addOption(
	"Если выбьешь дверь, я достану оружие (риск)", "end_good", 0.6, "end_bad4"
).addOption(
	"Подкупить коллектора", "bribe"
).addOptionState(
	"silent2", "Надо позвать ребят. Эй, открой дверь, а то хуже будет."
).addOption(
	"(Молчать)", "silent3"
).addOption(
	"Использовать запись собаки, чтобы отпугнуть", "dog_recording"
).addOption(
	"Позвать соседей на помощь", "call_neighbors"
).addOptionState(
	"silent3", "Похоже, здесь никого нет"
).addOption(
	"(Молчать)", "end_good"
).addOption(
	"Тихо вылезти через окно", "escape_window"
).addOptionState(
	"error", "Нет, всё верно, это тот адрес"
).addOption(
	"Вам будет хуже, если вы узнаете, что это не тот адрес.", "end_good3", 0.67, "end_bad4"
).addOption(
	"У меня нет долгов, я уже всё оплатил!", "payment_conflict"
).addOptionState(
	"id_request", "Удостоверение? У меня его с собой нет."
).addOption(
	"Тогда мы закончили разговор", "end_good"
).addOption(
	"Без удостоверения я не открою", "end_good2"
).addOptionState(
	"payment_conflict", "У нас есть информация, что долг остался."
).addOption(
	"Это ошибка, покажите документы", "doc_request"
).addOption(
	"Я уже связывался с вашей компанией, всё улажено", "end_good"
).addOptionState(
	"doc_request", "У меня нет их с собой, но я могу вернуться позже."
).addOption(
	"Ладно, ждём документов", "end_good3"
).addOption(
	"Я настаиваю, покажите сейчас", "end_bad4"
).addOptionState(
	"nopen", "Открой, иначе у тебя будут проблемы!"
).addOption(
	"Я не буду открывать!", "nopen2"
).addOption(
	"Уже вызвал полицию, сейчас приедут", "call_police"
).addOption(
	"Мне не о чем с вами говорить", "end_good2"
).addOptionState(
	"nopen2", "Открой! Сейчас мои ребята подойдут"
).addOption(
	"Ладно, открываю", "end_bad"
).addOption(
	"Я позвоню в полицию!", "end_good2"
).addOption(
	"Давай, зови их", "end_bad2"
).addOptionState(
	"delay", "Ладно, жду, но долго не тяни!"
).addOption(
	"Попробовать выскользнуть через заднюю дверь", "escape"
).addOption(
	"Написать другу и попросить помощи", "text_friend"
).addOption(
	"Подготовить план бегства", "escape_plan"
).addOptionState(
	"escape_plan", "Ты решил быстро подготовиться к побегу, если всё пойдёт не так."
).addOption(
	"Собрать важные вещи", "end_good"
).addOption(
	"Обдумать маршрут побега", "end_good2"
).addOptionState(
	"bribe", "Думаешь, это сработает? Сколько предложишь?"
).addOption(
	"Тысячу рублей", "bribe_fail"
).addOption(
	"Пять тысяч рублей", "bribe_success"
).addOptionState(
	"bribe_fail", "Слишком мало! Это не стоит риска."
).addOption(
	"Ладно, тогда ничего", "end_bad4"
).addOption(
	"Могу увеличить до трёх тысяч", "bribe_bargain"
).addOptionState(
	"bribe_success", "Хорошо, я уйду. Но лучше заплати долг в следующий раз."
).addOption(
	"Спасибо, до свидания", "end_good"
).addOption(
	"Больше так не делай!", "end_good"
).addOptionState(
	"bribe_bargain", "Ладно, я возьму это. Но тебе повезло, что я в хорошем настроении."
).addOption(
	"Отлично, договорились", "end_good"
).addOptionState(
	"dog_recording", "Что это? Собака? Ладно, не буду рисковать."
).addOption(
	"Это моя сторожевая собака, лучше уходите", "end_good"
).addOption(
	"Да, у меня большая собака", "end_good"
).addOptionState(
	"escape_window", "Ты вылез через окно и смог уйти, но будь осторожен в следующий раз."
).addOption(
	"Постараюсь быть осторожнее", "end_good"
).addOptionState(
	"call_neighbors", "Эй, помогите! Тут кто-то подозрительный!"
).addOption(
	"Соседи начали интересоваться", "end_good"
).addOption(
	"Кто-то из соседей вызвал полицию", "end_good2"
).addOptionState(
	"call_police", "Хорошо, подожду полицию, но это тебе не поможет."
).addOption(
	"Это меня защищает", "end_good2"
).addOption(
	"Полиция разберётся", "end_good2"
).addOptionState(
	"escape", "Ты выбежал через заднюю дверь и скрылся."
).addOption(
	"Теперь нужно быть осторожнее", "end_good"
).addOptionState(
	"text_friend", "Друг обещал прийти через несколько минут."
).addOption(
	"Спасибо, я буду ждать", "end_good2"
).addOption(
	"Надеюсь, он успеет вовремя", "end_good2"
).addEndState(
	"end_bad", "А теперь пора отдавать долги", DialogData.EndResult.Lose
).addEndState(
	"end_bad2", "Сейчас они придут", DialogData.EndResult.Lose
).addEndState(
	"end_bad3", "(Коллектор выбил дверь)", DialogData.EndResult.Lose
).addEndState(
	"end_bad4", "(Коллектор не поверил вам и выбил дверь)", DialogData.EndResult.Lose
).addEndState(
	"end_good", "Ладно, наверное мне стоит уйти", DialogData.EndResult.Win
).addEndState(
	"end_good2", "(Коллектор ушел. Теперь вы можете продолжать спокойно жить)", DialogData.EndResult.Win
).addEndState(
	"end_good3", "(Коллектор понял, что ошибся адресом и ушёл. Теперь вы можете продолжать спокойно жить)", DialogData.EndResult.Win
).endStateBuilding()

