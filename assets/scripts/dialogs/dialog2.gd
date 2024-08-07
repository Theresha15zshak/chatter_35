const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_cave.png")

var data:DialogData = DialogData.new(
	icon,
	"Пещера",
	"Найди золото пещеры"
).buildStates().setDefaultWinScreenText(
	"Вы смогли добыть золото и покинуть пещеру живым"
).setDefaultLoseScreenText(
	"Вы не смогли покинуть пещеру живым"
).addStartState( # start
		"Вы в древней пещере. Ваша цель - найти золото. " +
		"Легенда гласит, что пещера полна тайн и опасностей."
	).addOption(
		"Осмотреться", "explore"
	).addOption(
		"Продолжить", "start1"
	).addOptionState( # explore
		"explore", "Вы видите странные символы на стенах и чувствуете лёгкое движение воздуха из туннеля."
	).addOption(
		"Исследовать символы", "symbols"
	).addOption(
		"Следовать за движением воздуха", "air_tunnel"
	).addOptionState( # symbols
		"symbols", "Символы кажутся древними и магическими. Вы находите карту с заметками и медальон."
	).addOption(
		"Взять карту и медальон", "start1"
	).addOption(
		"Оставить их", "start1"
	).addOptionState( # air_tunnel
		"air_tunnel", "Вы следуете за движением воздуха и находите скрытый проход."
	).addOption(
		"Войти в проход", "secret_passage"
	).addOption(
		"Вернуться назад", "start1"
	).addOptionState( # secret_passage
		"secret_passage", "Вы находите древний алтарь с пылающим кристаллом. Он излучает тепло."
	).addOption(
		"Коснуться кристалла", "crystal_touch"
	).addOption(
		"Оставить кристалл", "start1"
	).addOptionState( # crystal_touch
		"crystal_touch", "Кристалл усиливает ваше зрение, вы замечаете скрытые ловушки на полу."
	).addOption(
		"Избегать ловушек", "start1"
	).addOption(
		"Игнорировать ловушки", "end_bad11"
	).addOptionState( # start1
		"start1", "Перед вами три прохода: к комнате с рычагом, " +
		"к призракам и третий к мосту. Куда пойдёте?"
	).addOption(
		"В комнату с рычагом", "lever_room"
	).addOption(
		"К призракам", "ghost_room"
	).addOption(
		"К мосту", "bridge_room"
	).addOptionState( # lever_room
		"lever_room", "Перед вами рычаг. Что сделаете?"
	).addOption(
		"Потянуть за рычаг", "lever"
	).addOption(
		"Вернуться", "start1"
	).addOptionState( # lever
		"lever", "Пол проваливается. Оставаться здесь опасно. Вы слышите звук шагов, идти на них или ждать?"
	).addOption(
		"Идти на звук шагов", "steps"
	).addOption(
		"Ждать", "end_bad1"
	).addOptionState( # steps
		"steps", "Вы видите старика, который предлагает помощь. Поверить ему?"
	).addOption(
		"Поверить", "follow_old_man"
	).addOption(
		"Не поверить и отказаться от помощи", "end_bad2"
	).addOptionState( # follow_old_man
		"follow_old_man", "Старик ведёт вас к статуе. Нужно решить головоломку. Попытаться решить?"
	).addOption(
		"Решить головоломку", "puzzle"
	).addOption(
		"Попробовать открыть силой", "end_bad3"
	).addOptionState( # puzzle
		"puzzle", "«Сила воды превыше огня». Выберите правильный порядок."
	).addOption(
		"Вода-Огонь-Земля-Воздух", "next_stage"
	).addOption(
		"Огонь-Вода-Воздух-Земля", "end_bad4"
	).addOptionState( # next_stage
		"next_stage", "Головоломка решена. Вы находите ключ к древней двери."
	).addOption(
		"Взять ключ", "start2"
	).addOption(
		"Оставить ключ", "start2"
	).addOptionState( # ghost_room
		"ghost_room", "Перед вами два призрака. Один из них спрашивает: «Что не имеет начала и конца?»"
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
	).addOptionState( # bridge_room
		"bridge_room", "Перед вами подземная река с хрупким мостом. Что сделать?"
	).addOption(
		"Перейти мост", "cross_bridge"
	).addOption(
		"Искать другой путь", "find_path"
	).addOptionState( # cross_bridge
		"cross_bridge", "Вы переходите мост и видите золотую дверь."
	).addOption(
		"Открыть дверь", "golden_door"
	).addOption(
		"Вернуться", "start1"
	).addOptionState( # find_path
		"find_path", "Вы находите лодку и переплываете реку. «Что принадлежит вам, но другие используют чаще?»"
	).addOption(
		"Имя", "end_good"
	).addOption(
		"Тень", "end_bad7"
	).addOptionState( # golden_door
		"golden_door", "Дверь открывается, вы видите сокровища."
	).addOption(
		"Подобрать золото", "n_go"
	).addOption(
		"Закрыть дверь", "start1"
	).addOptionState( # n_go
		"n_go", "Начинается землетрясение. Оставаться здесь опасно. Ваши действия?"
	).addOption(
		"Создать гранату", "end_bad8"
	).addOption(
		"Бежать", "n_go2"
	).addOption(
		"Ждать помощи", "end_bad9"
	).addOptionState( # n_go2
		"n_go2", "Выход заблокирован кодовой панелью: 'X---'. «После X следует Y, после Y — X.»"
	).addOption(
		"XYXY", "end_good"
	).addOption(
		"XXYX", "end_bad10"
	).addOption(
		"XYYX", "end_bad10"
	).addOptionState( # start2
		"start2", "Вы продвигаетесь глубже в пещеру и находите три новых прохода."
	).addOption(
		"Спуститься в темный туннель", "dark_tunnel"
	).addOption(
		"Войти в зал со светящимися кристаллами", "crystal_hall"
	).addOption(
		"Подняться по крутой лестнице", "steep_stairs"
	).addOptionState( # dark_tunnel
		"dark_tunnel", "Туннель становится всё темнее, и вы слышите шорохи."
	).addOption(
		"Исследовать звук", "end_bad12"
	).addOption(
		"Вернуться назад", "start2"
	).addOptionState( # crystal_hall
		"crystal_hall", "Кристаллы светятся и начинают резонировать, открывая портал."
	).addOption(
		"Войти в портал", "end_good"
	).addOption(
		"Остаться в зале", "end_bad13"
	).addOptionState( # steep_stairs
		"steep_stairs", "Вы поднимаетесь и видите древний тронный зал с артефактом."
	).addOption(
		"Исследовать артефакт", "artifact"
	).addOption(
		"Покинуть зал", "start2"
	).addOptionState( # artifact
		"artifact", "Артефакт начинает светиться, открывая секретный выход."
	).addOption(
		"Воспользоваться выходом", "end_good"
	).addOption(
		"Игнорировать артефакт", "end_bad14"
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
		"end_bad6", "Вы остались без сокровищ и не достигли своей цели", DialogData.EndResult.Lose,
		"Вы не смогли добыть золото пещеры"
	).addEndState( # end_bad7
		"end_bad7", "Вы проиграли и теперь ваша участь не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad8
		"end_bad8", "Граната подрывает всё и убивает вас", DialogData.EndResult.Lose
	).addEndState( # end_bad9
		"end_bad9", "Вы остались ждать помощи, но никто вам не помог и теперь ваша участь не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad10
		"end_bad10", "Вы решили загадку неправильно и теперь ваша судьба не завидна", DialogData.EndResult.Lose
	).addEndState( # end_bad11
		"end_bad11", "Вы попали в ловушку и погибли", DialogData.EndResult.Lose
	).addEndState( # end_bad12
		"end_bad12", "Вы попали в засаду и были схвачены", DialogData.EndResult.Lose
	).addEndState( # end_bad13
		"end_bad13", "Вы остались в зале, и портал закрылся навсегда", DialogData.EndResult.Lose
	).addEndState( # end_bad14
		"end_bad14", "Вы упустили возможность покинуть пещеру и погибли", DialogData.EndResult.Lose
	).addEndState( # end_good
		"end_good", "Вы нашли выход и покинули пещеру с сокровищами", DialogData.EndResult.Win
	).endStateBuilding()


