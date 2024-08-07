const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_rescue.png")

var data:DialogData = DialogData.new(
	icon,
	"Служба спасения",
	"Наводнение"
).buildStates().setDefaultWinScreenText(
	"Вам удалось выжить"
).setDefaultLoseScreenText(
	"Вам не удалось выжить"
).addStartState(
	"Здравствуйте, это служба спасения. Какова ваша ситуация и где вы находитесь?"
).addOption(
	"Я в доме, уровень воды быстро поднимается. Мы на втором этаже, адрес: улица Лесная, 5.", "report_location"
).addOption(
	"Вода окружила мой дом, и я не могу выйти. Что мне делать?", "ask_for_advice"
).addOption(
	"Я вижу, как вода заливает улицы. Есть ли спасательные лодки поблизости?", "ask_about_boats"
).addOptionState( # report_location
	"report_location", "Спасибо. Оставайтесь на втором этаже. Спасатели в пути."
).addOption(
	"Как долго ждать спасателей?", "rescue_time"
).addOption(
	"Что делать, если вода поднимется выше?", "ask_if_water_rises"
).addOption(
	"Слышу, как соседи зовут на помощь. Как помочь?", "help_neighbors"
).addOption(
	"Я беспокоюсь о своей семье, что сделать в первую очередь?", "family_safety"
).addOptionState( # rescue_time
	"rescue_time", "Спасатели прибудут через час. Оставайтесь на связи."
).addOption(
	"Спасибо, я буду ждать здесь.", "prepare_to_wait"
).addOption(
	"Спасибо, свяжитесь со мной, когда будете близко.", "prepare_to_wait"
).addOptionState( # prepare_to_wait
	"prepare_to_wait", "Проверьте уровень воды. Будьте готовы к эвакуации."
).addOption(
	"Понял, буду следить за уровнем воды.", "monitor_water_level"
).addOption(
	"Уже готовлюсь к возможной эвакуации.", "monitor_water_level"
).addOptionState( # monitor_water_level
	"monitor_water_level", "Убедитесь, что у вас есть средства связи снаружи."
).addOption(
	"Мы все в порядке и готовы к эвакуации.", "stay_ready"
).addOption(
	"Все подготовлено, спасибо за поддержку.", "stay_ready"
).addOptionState( # stay_ready
	"stay_ready", "Сигнализируйте, если ситуация изменится."
).addOption(
	"Понял, будем держать вас в курсе.", "end_good"
).addOption(
	"Спасибо, остаемся на связи.", "end_good"
).addOptionState( # ask_if_water_rises
	"ask_if_water_rises", "Подготовьтесь к перемещению на крышу, если вода поднимется."
).addOption(
	"Я понял, начну подготовку.", "prepare_to_move"
).addOption(
	"Буду следовать вашим инструкциям, спасибо.", "prepare_to_move"
).addOptionState( # prepare_to_move
	"prepare_to_move", "Возьмите телефон, воду, еду, фонарь и одеяла."
).addOption(
	"Хорошо, я упакую всё необходимое.", "pack_essentials"
).addOption(
	"Уже занимаюсь подготовкой, спасибо.", "pack_essentials"
).addOptionState( # pack_essentials
	"pack_essentials", "Выключите электричество в доме для безопасности."
).addOption(
	"Я отключил электричество в доме.", "turn_off_electricity"
).addOption(
	"Сейчас проверяю, спасибо за напоминание.", "turn_off_electricity"
).addOptionState( # turn_off_electricity
	"turn_off_electricity", "Отлично, это поможет избежать поражения током."
).addOption(
	"Да, безопасность прежде всего.", "prepare_for_roof"
).addOption(
	"Спасибо за ваши советы.", "prepare_for_roof"
).addOptionState( # prepare_for_roof
	"prepare_for_roof", "Убедитесь, что вы можете сигнализировать спасателям."
).addOption(
	"У меня есть фонарик и яркая одежда.", "signal_for_help"
).addOption(
	"Мы подготовили сигнальный флаг и свисток.", "signal_for_help"
).addOptionState( # signal_for_help
	"signal_for_help", "Это поможет спасателям быстрее вас найти."
).addOption(
	"Спасибо, жду вашего сигнала.", "end_good"
).addOption(
	"Спасибо за поддержку, ждем спасателей.", "end_good"
).addOptionState( # help_neighbors
	"help_neighbors", "Свяжитесь с соседями по телефону и уточните, где они."
).addOption(
	"Уже звоню им. Спасибо за совет.", "call_neighbors"
).addOption(
	"Я попробую связаться с ними через окна.", "contact_through_windows"
).addOptionState( # call_neighbors
	"call_neighbors", "Если они в безопасности, пусть остаются на местах."
).addOption(
	"Понял, сообщу им об этом.", "end_good"
).addOption(
	"Спасибо, постараюсь помочь им на расстоянии.", "end_good"
).addOptionState( # contact_through_windows
	"contact_through_windows", "Попробуйте направить соседей в безопасное место."
).addOption(
	"Хорошо, попытаюсь направить их в безопасное место.", "guide_to_safety"
).addOption(
	"Буду следить за их состоянием, спасибо.", "guide_to_safety"
).addOptionState( # guide_to_safety
	"guide_to_safety", "Убедитесь, что соседи подготовили всё необходимое."
).addOption(
	"Сообщил им о необходимости подготовиться.", "end_good"
).addOption(
	"Спасибо, это важно. Держу их в курсе.", "end_good"
).addOptionState( # ask_for_advice
	"ask_for_advice", "Переместитесь на самый высокий уровень дома. Подготовьте вещи."
).addOption(
	"Понял, уже иду наверх.", "move_to_highest_level"
).addOption(
	"Спасибо, буду готов.", "move_to_highest_level"
).addOptionState( # move_to_highest_level
	"move_to_highest_level", "Вы один или с кем-то ещё? Убедитесь, что все в безопасности."
).addOption(
	"Я с семьей, все в порядке.", "check_family_safety"
).addOption(
	"Я один, но у меня есть домашние животные.", "check_pets_safety"
).addOptionState( # check_family_safety
	"check_family_safety", "Убедитесь, что все понимают план действий."
).addOption(
	"Да, мой телефон заряжен и я на связи.", "stay_connected"
).addOption(
	"Да, мы подготовлены и ждем спасателей.", "stay_connected"
).addOptionState( # check_pets_safety
	"check_pets_safety", "Возьмите корм и воду для животных. Они должны быть с вами."
).addOption(
	"Уже все подготовил, спасибо.", "stay_connected"
).addOption(
	"Я позаботился о них, они со мной.", "stay_connected"
).addOptionState( # stay_connected
	"stay_connected", "Это поможет нам координировать действия и обеспечить вашу безопасность."
).addOption(
	"Спасибо, жду вашего сигнала.", "end_good"
).addOption(
	"Спасибо за поддержку, ждем спасателей.", "end_good"
).addOptionState( # family_safety
	"family_safety", "Убедитесь, что все понимают план действий и готовы к эвакуации."
).addOption(
	"Я разъяснил план действия всем членам семьи.", "plan_explained"
).addOption(
	"Я организую эвакуацию на крышу, если вода поднимется выше.", "organize_evacuation"
).addOptionState( # plan_explained
	"plan_explained", "Следите за уровнем воды и держите средства связи под рукой."
).addOption(
	"Мы будем на связи и готовы к действиям.", "end_good"
).addOption(
	"Спасибо за помощь, мы все понимаем.", "end_good"
).addOptionState( # organize_evacuation
	"organize_evacuation", "Убедитесь, что все знают, что брать с собой: воду, еду, фонарики, зарядки."
).addOption(
	"Я подготовил все необходимое для эвакуации.", "evacuation_ready"
).addOption(
	"Мы готовы и ждём вашего сигнала.", "evacuation_ready"
).addOptionState( # evacuation_ready
	"evacuation_ready", "Ваша подготовка может сыграть ключевую роль в этой ситуации."
).addOption(
	"Спасибо, держите нас в курсе.", "end_good"
).addOption(
	"Мы готовы, ждём вашу команду.", "end_good"
).addOptionState( # ask_about_boats
	"ask_about_boats", "Спасательные лодки направляются в ваш район. Оставайтесь на связи."
).addOption(
	"Буду ждать здесь, спасибо за информацию.", "monitor_boat_arrival"
).addOption(
	"Хорошо, держите меня в курсе.", "monitor_boat_arrival"
).addOptionState( # monitor_boat_arrival
	"monitor_boat_arrival", "Убедитесь, что все готовы к эвакуации на лодку."
).addOption(
	"Все готовы, мы ждём.", "end_good"
).addOption(
	"Постараемся быть наготове, спасибо.", "end_good"
).addOptionState( # prepare_to_escape
	"prepare_to_escape", "Если вода поднимется выше, перемещайтесь на крышу, но будьте осторожны с ветром."
).addOption(
	"Я понял, буду готов.", "stay_safe_on_roof"
).addOption(
	"Спасибо за советы, будем следить за ситуацией.", "stay_safe_on_roof"
).addOptionState( # stay_safe_on_roof
	"stay_safe_on_roof", "Убедитесь, что вы видимы для спасателей, и у вас есть способ привлечь их внимание."
).addOption(
	"У меня есть фонарик и яркая одежда, чтобы сигнализировать.", "signal_for_help"
).addOption(
	"Мы приготовили сигнальный флаг, чтобы привлечь внимание.", "signal_for_help"
).addOptionState( # signal_for_help
	"signal_for_help", "Это поможет спасателям быстрее вас найти. Мы на пути к вам."
).addOption(
	"Спасибо за поддержку, ждем спасателей.", "end_good"
).addOption(
	"Спасибо, остаемся на связи.", "end_good"
).addEndState( # end_good
	"end_good", "Вы безопасно ждете спасателей. Ваши действия помогли избежать опасности.", DialogData.EndResult.Win
).endStateBuilding()






