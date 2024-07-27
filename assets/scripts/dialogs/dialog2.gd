const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_cave.png")

var data:DialogData = DialogData.new(
	icon,
	"Пещера",
	"Найди золото пещеры"
).buildStates().addStartState( # start
		"Вы в древней пещере. Ваша цель - найти золото."
	).addOption(
		"Продолжить", "start1"
	).addOptionState( # start1
		"start1", "Перед вами три прохода: комната с рычагом, к призракам и к мосту. Куда пойдете?"
	).addOption(
		"комната с рычагом", "left"
	).addOption(
		"к призракам", "right"
	).addOption(
		"к мосту", "straight"
	).addOptionState( # left
		"left", "Левая дверь ведет в комнату с рычагом. Что сделаете?"
	).addOption(
		"Потянуть за рычаг", "lever"
	).addOption(
		"Вернуться", "start"
	).addOptionState( # lever
		"lever", "Пол проваливается. Оставаться здесь опасно. Идти на звук шагов или ждать?"
	).addOption(
		"Идти на звук шагов", "steps"
	).addOption(
		"Ждать", "end_bad1"
	).addOptionState( # steps
		"steps", "Вы видите старика, который предлагает помощь. Поверить ему?"
	).addOption(
		"Поверить", "follow_old_man"
	).addOption(
		"Отказаться", "end_bad2"
	).addOptionState( # follow_old_man
		"follow_old_man", "Старик ведет вас к статуе. Нужно решить головоломку. Попытаться решить?"
	).addOption(
		"Решить головоломку", "puzzle"
	).addOption(
		"Попробовать открыть силой", "end_bad3"
	).addOptionState( # puzzle
		"puzzle", "Руны: 'Сила воды превыше огня'. Выберите правильный порядок."
	).addOption(
		"Вода-Огонь-Земля-Воздух", "end_good"
	).addOption(
		"Огонь-Вода-Воздух-Земля", "end_bad4"
	).addOptionState( # right
		"right", "Перед вами два призрака. 'Что не имеет начала и конца?'"
	).addOption(
		"Кольцо", "ring"
	).addOption(
		"Время", "end_bad5"
	).addOptionState( # ring
		"ring", "Призраки исчезают, открывая путь к золоту."
	).addOption(
		"Подобрать золото", "n_go"
	).addOption(
		"Оставить золото", "end_bad6"
	).addOptionState( # straight
		"straight", "Перед вами подземная река с хрупким мостом. Что сделать?"
	).addOption(
		"Перейти мост", "cross_bridge"
	).addOption(
		"Искать другой путь", "find_path"
	).addOptionState( # cross_bridge
		"cross_bridge", "Вы переходите мост и видите золотую дверь."
	).addOption(
		"Открыть дверь", "golden_door"
	).addOption(
		"Вернуться", "start"
	).addOptionState( # find_path
		"find_path", "Вы находите лодку и переплываете реку. 'Что принадлежит вам, но другие используют чаще?'"
	).addOption(
		"Имя", "end_good"
	).addOption(
		"Тень", "end_bad7"
	).addOptionState( # golden_door
		"golden_door", "Дверь открывается, вы видите сокровища."
	).addOption(
		"Подобрать золото", "n_go"
	).addOption(
		"Закрыть дверь", "start"
	).addOptionState( # n_go
		"n_go", "Начинается землетрясение. Оставаться здесь опасно. Ваши действия?"
	).addOption(
		"Создать гранату", "end_bad8"
	).addOption(
		"Бежать", "n_go2"
	).addOption(
		"Ждать помощи", "end_bad9"
	).addOptionState( # n_go2
		"n_go2", "Выход заблокирован кодовой панелью: 'X---'. После X следует Y, после Y — X."
	).addOption(
		"XYXY", "end_good"
	).addOption(
		"XXYX", "end_bad10"
	).addOption(
		"XYYX", "end_bad10"
	).addEndState( # end_bad1
		"end_bad1", "Пол под вами провалился и вы умерли", DialogData.EndResult.Lose
	).addEndState( # end_bad2
		"end_bad2", "У вас нет способа спастись и вы умираете", DialogData.EndResult.Lose
	).addEndState( # end_bad3
		"end_bad3", "Решение силой не привело к чему-либо хорошему", DialogData.EndResult.Lose
	).addEndState( # end_bad4
		"end_bad4", "Вы решили загадку неправильно и теперь ваша судьба не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad5
		"end_bad5", "Вы ошиблись и теперь ваша судьба не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad6
		"end_bad6", "Вы остались без сокровищ и не достигли своей цели", DialogData.EndResult.Lose
	).addEndState( # end_bad7
		"end_bad7", "Вы проиграли и теперь ваша участь не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad8
		"end_bad8", "Граната подрывает все и убивает вас", DialogData.EndResult.Lose
	).addEndState( # end_bad9
		"end_bad9", "Вы остались ждать помощи, но никто вам не помог и теперь ваша участь не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad10
		"end_bad10", "Вы решили загадку неправильно и теперь ваша судьба не завидна", DialogData.EndResult.Lose
	).addEndState( # end_good
		"end_good", "Вы решили загадку правильно и теперь вы спасены", DialogData.EndResult.Win
	).endStateBuilding()
