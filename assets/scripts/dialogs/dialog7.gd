const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_boss.png")

var data:DialogData = DialogData.new(
	icon,
	"Босс",
	"Получи повышение"
).buildStates().addStartState(
	"Здравствуйте!"
).addOption(
	"Здравствуйте, я хочу повышение.", "state1"
).addOptionState( # state1
	"state1", "Почему вы считаете, что заслуживаете повышения?"
).addOption(
	"Я хорошо показал себя в прошлом месяце и долго работаю в компании.", "state2"
).addOptionState( # state2
	"state2", "Это хорошо, но расскажите подробнее о своих достижениях."
).addOption(
	"Я принес компании большую прибыль своей работой.", "state3"
).addOptionState( # state3
	"state3", "Прибыль важна, но не единственный фактор. Что еще?"
).addOption(
	"Я помогал коллегам и улучшил процессы.", "state4"
).addOptionState( # state4
	"state4", "Это впечатляет. Продолжайте."
).addOption(
	"Я также обучал новых сотрудников.", "state5"
).addOptionState( # state5
	"state5", "Обучение новых сотрудников - это ценно. Что еще?"
).addOption(
	"Я разработал систему, которая улучшила продуктивность.", "state6"
).addOptionState( # state6
	"state6", "Это значимо. Давайте продолжим."
).addOption(
	"Я внедрил новые методы работы, которые сэкономили время и ресурсы.", "state7"
).addOptionState( # state7
	"state7", "Экономия времени и ресурсов - это всегда плюс. Что еще?"
).addOption(
	"Я организовал тренинги для команды.", "state8"
).addOptionState( # state8
	"state8", "Тренинги важны для развития. Что еще?"
).addOption(
	"Я всегда готов помочь коллегам и поддерживать команду.", "state9"
).addOptionState( # state9
	"state9", "Поддержка команды важна. Что еще?"
).addOption(
	"Я разработал новые проекты, которые успешно реализованы.", "state10"
).addOptionState( # state10
	"state10", "Новые проекты - это хорошо. Продолжайте."
).addOption(
	"Я работал сверхурочно для достижения целей.", "state11"
).addOptionState( # state11
	"state11", "Работа сверхурочно - это большой плюс. Что еще?"
).addOption(
	"Мои усилия помогли компании достичь новых высот.", "state12"
).addOptionState( # state12
	"state12", "Ваш вклад значителен. Что еще?"
).addOption(
	"Я участвовал в разработке новых стратегий.", "state13"
).addOptionState( # state13
	"state13", "Новые стратегии важны для развития. Что еще?"
).addOption(
	"Я поддерживаю позитивный настрой в команде.", "state14"
).addOptionState( # state14
	"state14", "Позитивный настрой важен. Что еще?"
).addOption(
	"Я внедрил инновационные идеи.", "state15"
).addOptionState( # state15
	"state15", "Инновации важны для прогресса. Что еще?"
).addOption(
	"Я способствовал улучшению качества работы.", "state16"
).addOptionState( # state16
	"state16", "Качество работы - ключ к успеху. Что еще?"
).addOption(
	"Я разработал систему мотивации для команды.", "state17"
).addOptionState( # state17
	"state17", "Мотивация команды важна. Что еще?"
).addOption(
	"Я оптимизировал рабочие процессы.", "state18"
).addOptionState( # state18
	"state18", "Оптимизация процессов - это плюс. Что еще?"
).addOption(
	"Я внедрил систему отчетности, которая улучшила контроль.", "state19"
).addOptionState( # state19
	"state19", "Контроль важен для успеха. Что еще?"
).addOption(
	"Я разработал программу обучения для новых сотрудников.", "state20"
).addOptionState( # state20
	"state20", "Обучение новых сотрудников ценно. Что еще?"
).addOption(
	"Я способствовал улучшению коммуникаций в команде.", "state21"
).addOptionState( # state21
	"state21", "Коммуникации важны. Что еще?"
).addOption(
	"Я разработал систему обратной связи.", "state22"
).addOptionState( # state22
	"state22", "Обратная связь важна. Что еще?"
).addOption(
	"Я внедрил методики повышения эффективности.", "state23"
).addOptionState( # state23
	"state23", "Эффективность важна для компании. Что еще?"
).addOption(
	"Я участвовал в стратегических планерках.", "state24"
).addOptionState( # state24
	"state24", "Стратегическое планирование важно. Что еще?"
).addOption(
	"Я улучшил взаимодействие между отделами.", "state25"
).addOptionState( # state25
	"state25", "Взаимодействие между отделами важно. Что еще?"
).addOption(
	"Я внедрил систему управления проектами.", "state26"
).addOptionState( # state26
	"state26", "Управление проектами важно. Что еще?"
).addOption(
	"Я разработал программу поощрений.", "state27"
).addOptionState( # state27
	"state27", "Поощрения важны. Что еще?"
).addOption(
	"Я способствовал улучшению рабочих условий.", "state28"
).addOptionState( # state28
	"state28", "Рабочие условия важны. Что еще?"
).addOption(
	"Я участвовал в разработке корпоративной культуры.", "state29"
).addOptionState( # state29
	"state29", "Корпоративная культура важна. Что еще?"
).addOption(
	"Я всегда стремлюсь к профессиональному росту.", "state30"
).addOptionState( # state30
	"state30", "Ваше стремление ценно. Мы рассмотрим ваше повышение."
).addOption(
	"Спасибо за понимание.", "end_good", 0.9
).addEndState( # end_good
	"end_good", "Начальник вам поверил и рассматривает ваше повышение", DialogData.EndResult.Win
).addEndState( # end_bad
	"end_bad", "Начальник вам не поверил", DialogData.EndResult.Lose
).endStateBuilding()
