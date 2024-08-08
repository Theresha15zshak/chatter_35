const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_bandit.png")

var data:DialogData = DialogData.new(
	icon,
	"Бандит",
	"Спасись от бандита и сохрани вещи"
).buildStates().setDefaultWinScreenText(
	"Вам удалось избежать ограбления"
).setDefaultLoseScreenText(
	"Бандит ограбил вас"
).addStartState(
	"Это ограбление! Давай сюда кошелёк и телефон! Иначе ножом тебя."
).addOption(
	"Вот, берите (Отдать кошелёк и телефон)", "give"
).addOption(
	"Попробуй, догони меня (Убежать)", "run"
).addOption(
	"Давай, попробуй! (Дать бой)", "fight"
).addOption(
	"Тебе не стоит меня грабить", "talk"
).addOptionState(
	"give", "Вали отсюда теперь"
).addOption(
	"Ухожу!", "end_bad1"
).addOption(
	"Попробовать незаметно следить за бандитом", "follow"
).addOptionState(
	"follow", "Ты думаешь, я не замечу, как ты за мной идёшь?"
).addOption(
	"Извините, ошибся", "end_bad1"
).addOption(
	"Просто хотел знать, куда вы идёте", "end_bad3"
).addOption(
	"Попробовать сфотографировать его", "take_photo"
).addOptionState(
	"take_photo", "Ты что, фотографируешь меня?!"
).addOption(
	"Да, для полиции", "end_bad2"
).addOption(
	"Нет, просто проверяю камеру", "end_bad3"
).addOption(
	"Убежать после фото", "end_good1"
).addOptionState(
	"run", "Эй, а ну иди сюда!"
).addOption(
	"Бежать дальше (Риск)", "run_fast", 0.5, "end_bad3"
).addOption(
	"Остановиться (Риск)", "caught"
).addOption(
	"Петлять по улицам", "zigzag"
).addOptionState(
	"run_fast", "Ты бежишь так быстро, что бандит не может догнать тебя."
).addOption(
	"Продолжать бежать", "end_good1"
).addOption(
	"Спрятаться за углом", "hide_corner"
).addOptionState(
	"hide_corner", "Ты спрятался за углом и видишь, как бандит пробегает мимо."
).addOption(
	"Подождать, пока он уйдёт", "end_good1"
).addOption(
	"Посмотреть, куда он пошёл", "end_good2"
).addOptionState(
	"zigzag", "Ты начал петлять по улицам, чтобы сбить бандита с толку."
).addOption(
	"Скрыться в переулке", "alley_escape"
).addOption(
	"Попробовать зайти в магазин", "store_entry"
).addOptionState(
	"alley_escape", "Ты сумел скрыться в переулке, и бандит потерял тебя из виду."
).addOption(
	"Проверить, нет ли за тобой слежки", "end_good1"
).addOption(
	"Выйти другим путём", "end_good2"
).addOptionState(
	"store_entry", "Ты вошёл в магазин и бандит не последовал за тобой."
).addOption(
	"Позвать охрану", "end_good2"
).addOption(
	"Подождать в магазине", "end_good1"
).addOptionState(
	"caught", "Попался! Теперь ты у меня заплатишь, жмур. А ну-ка, давай вещи, а то дам по лицу."
).addOption(
	"(Отдать кошелёк и телефон)", "give"
).addOption(
	"(Попытаться выбраться и снова убежать)", "run_again"
).addOptionState(
	"run_again", "Ну всё, доигрался, теперь ты труп!"
).addOption(
	"(Смириться)", "end_bad1"
).addOption(
	"(Попытаться выбежать из толпы)", "crowd_escape"
).addOptionState(
	"crowd_escape", "Ты затерялся в толпе и сумел скрыться."
).addOption(
	"(Спрятаться в магазине)", "store_hide"
).addOptionState(
	"store_hide", "Ты спрятался в магазине, и бандит потерял тебя из виду."
).addOption(
	"Подождать, пока он уйдет", "end_good1"
).addOption(
	"Позвать охрану", "end_good2"
).addOptionState(
	"fight", "Сейчас ты заплатишь у меня!"
).addOption(
	"(Драться с бандитом, риск)", "end_good2", 0.25, "end_bad2"
).addOption(
	"(Использовать подручные средства)", "fight_tools"
).addOption(
	"(Схватить что-то тяжелое)", "grab_weapon"
).addOptionState(
	"fight_tools", "Ты быстро схватил подручные предметы и начал обороняться."
).addOption(
	"Ударить его палкой", "end_good2"
).addOption(
	"Бросить песок ему в глаза", "end_good2"
).addOptionState(
	"grab_weapon", "Ты схватил тяжелый предмет и приготовился обороняться."
).addOption(
	"Ударить его", "end_good2"
).addOption(
	"Испугать его", "end_good3"
).addOptionState(
	"talk", "Да? А с чего это?"
).addOption(
	"Тут везде полиция, я на тебя доложу и тебя сразу же посадят. Если убьёшь, то сядешь на всю жизнь",
	"talk_success", 0.3, "end_bad1"
).addOption(
	"У меня крыша из твоих братков, Юра меня крышует", "end_good3", 0.3, "end_bad1"
).addOption(
	"У меня крыша из твоих братков, Андрюха меня крышует", "end_good3"
).addOption(
	"Ты знаешь, что рядом камеры? Все записано", "camera_bluff"
).addOptionState(
	"camera_bluff", "Камеры? Ладно, не буду рисковать, но следи за собой!"
).addOption(
	"Конечно, спасибо за понимание", "end_good"
).addOption(
	"Больше не пытайся меня грабить", "end_good4"
).addOptionState(
	"talk_success", "Наверное, ты прав, давай, вали отсюда."
).addOption(
	"(Убежать)", "end_good4"
).addEndState(
	"end_bad1", "Ха-ха-ха", DialogData.EndResult.Lose
).addEndState(
	"end_bad2", "На тебе по бочине. Теперь ты жмур", DialogData.EndResult.Lose
).addEndState(
	"end_bad3", "(Бандит оказался быстрее вас)", DialogData.EndResult.Lose
).addEndState(
	"end_good1", "Э, ты куда убежал?", DialogData.EndResult.Win
).addEndState(
	"end_good", "Ок", DialogData.EndResult.Win
).addEndState(
	"end_good2", "Ай, сдаюсь-сдаюсь", DialogData.EndResult.Win
).addEndState(
	"end_good3", "Хм, ну ты прав, иди отсюда ", DialogData.EndResult.Win
).addEndState(
	"end_good4", "Давай, быстро вали", DialogData.EndResult.Win
).endStateBuilding()
