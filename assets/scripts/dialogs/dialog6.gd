const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_bandit.png")

var data:DialogData = DialogData.new(
	icon,
	"Бандит",
	"Спасись от бандита и сохрани вещи"
).buildStates().addStartState(
	"Это ограбление! Давай сюда кошелек и телефон! Иначе ножом тебя."
).addOption(
	"Вот берите (Отдать кошелек и телефон)", "give"
).addOption(
	"Попробуй догони меня (Убежать)", "run"
).addOption(
	"Давай попробуй! (Дать бой)", "fight"
).addOption(
	"Тебе не стоит меня грабить", "talk"
).addOptionState( # give
	"give", "Вали отсюда теперь"
).addOption(
	"Ухожу!", "end_bad1"
).addOptionState( # run
	"run", "Эй, а ну иди сюда!"
).addOption(
	"Бежать дальше (Риск)", "end_good1", 0.01
).addOption(
	"Бандит догоняет вас и угрожает (Риск)", "caught"
).addOptionState( # caught
	"caught", "Попался! Теперь ты у меня заплачешь, жмур. А ну ка давай вещи, а то дам по лицу."
).addOption(
	"Отдать кошелек и телефон", "give"
).addOption(
	"(Попытаться выбраться и снова убежать)", "run_again", 0.99
).addOptionState( # run_again
	"run_again", "Ну все, доигрался, теперь ты труп!"
).addOption(
	"(Попробовать убежать)", "end_bad1", 0.25
).addOptionState( # fight
	"fight", "Сейчас ты заплачешь у меня!"
).addOption(
	"(Драться с бандитом риск)", "end_good2", 0.25
).addOptionState( # talk
	"talk", "Да? А с чего это?"
).addOption(
	"Тут везде полиция, я на тебя доложу и тебя сразу же посадят. Если убьешь, то сядешь на всю жизнь",
	"talk_success",
	0.3
).addOption(
	"У меня крыша из твоих братков, Юра меня крышует", "end_good3", 0.3
).addOption(
	"У меня крыша из твоих братков, Андрюха меня крышует", "end_good3"
).addOptionState( # talk_success
	"talk_success", "Наверное ты прав, давай вали отсюда."
).addOption(
	"(Убежать)", "end_good4"
).addEndState( # end_bad1
	"end_bad1", "Хахаха ", DialogData.EndResult.Lose
).addEndState( # end_bad2
	"end_bad2", "На тебе по бочине. Теперь ты жмур", DialogData.EndResult.Lose
).addEndState( # end_good1
	"end_good1", "Э , ты куда убежал?", DialogData.EndResult.Win
).addEndState( # end_good2
	"end_good2", "Ай, сдаюсь сдаюсь", DialogData.EndResult.Win
).addEndState( # end_good3
	"end_good3", "Хм, ну ты прав иди отсюда ", DialogData.EndResult.Win
).addEndState( # end_good4
	"end_good4", "Давай быстро вали", DialogData.EndResult.Win
).endStateBuilding()
