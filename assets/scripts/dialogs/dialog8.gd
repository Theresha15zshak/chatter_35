const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_rescue.png")

var data:DialogData = DialogData.new(
	icon,
	"Оператор службы спасения",
	"Наводнение"
).buildStates().addStartState(
	"Здравствуйте, это служба спасения. Какова ваша ситуация и где вы находитесь?"
).addOption(
	"Я в доме, уровень воды быстро поднимается. Мы на втором этаже, адрес: улица Лесная, 5.", "report_location"
).addOption(
	"Вода окружила мой дом, и я не могу выйти. Что мне делать?", "ask_for_advice"
).addOption(
	"Я вижу, как вода заливает улицы. Есть ли спасательные лодки поблизости?", "ask_about_boats"
).addOptionState( # report_location
	"report_location", "Спасибо за информацию. Оставайтесь на втором этаже и избегайте окон. Мы отправляем спасательный отряд к вашему дому."
).addOption(
	"Как долго ждать спасателей?", "rescue_time"
).addOption(
	"Что мне делать, если вода поднимется выше?", "ask_if_water_rises"
).addOption(
	"Я слышу, как соседи зовут на помощь. Как я могу помочь им?", "help_neighbors"
).addOptionState( # rescue_time
	"rescue_time", "Команда будет у вас в течение часа. Пожалуйста, сохраняйте спокойствие и оставайтесь на связи."
).addOption(
	"Спасибо, я буду ждать здесь.", "end_good"
).addOption(
	"Спасибо, свяжитесь со мной, когда будете близко.", "end_good"
).addOptionState( # ask_if_water_rises
	"ask_if_water_rises", "Подготовьтесь к возможному перемещению на крышу, если уровень воды продолжит расти."
).addOption(
	"Я понял, начну подготовку.", "prepare_to_move"
).addOption(
	"Буду следовать вашим инструкциям, спасибо.", "prepare_to_move"
).addOptionState( # prepare_to_move
	"prepare_to_move", "Не забудьте взять с собой всё необходимое: телефон, воду, еду, фонарь и одеяла."
).addOption(
	"Хорошо, я упакую всё необходимое.", "pack_essentials"
).addOption(
	"Уже занимаюсь подготовкой, спасибо.", "pack_essentials"
).addOptionState( # pack_essentials
	"pack_essentials", "Вы находитесь в безопасной зоне? Убедитесь, что нет электрических приборов в зоне риска."
).addOption(
	"Я отключил электричество в доме.", "turn_off_electricity"
).addOption(
	"Сейчас проверяю, спасибо за напоминание.", "turn_off_electricity"
).addOptionState( # turn_off_electricity
	"turn_off_electricity", "Это поможет избежать опасности поражения электрическим током."
).addOption(
	"Да, безопасность прежде всего.", "end_good"
).addOption(
	"Спасибо за ваши советы.", "end_good"
).addOptionState( # help_neighbors
	"help_neighbors", "Попробуйте связаться с ними по телефону и уточнить, где они находятся. Возможно, они нуждаются в медицинской помощи."
).addOption(
	"Уже звоню им. Спасибо за совет.", "call_neighbors"
).addOption(
	"Я попробую связаться с ними через окна.", "contact_through_windows"
).addOptionState( # call_neighbors
	"call_neighbors", "Отлично. Если они в безопасности, пусть остаются на своих местах до прибытия помощи."
).addOption(
	"Понял, сообщу им об этом.", "end_good"
).addOption(
	"Спасибо, постараюсь помочь им на расстоянии.", "end_good"
).addOptionState( # contact_through_windows
	"contact_through_windows", "Если они в беде, попробуйте направить их к безопасному месту в доме."
).addOption(
	"Хорошо, попытаюсь направить их в безопасное место.", "guide_to_safety"
).addOption(
	"Буду следить за их состоянием, спасибо.", "guide_to_safety"
).addOptionState( # guide_to_safety
	"guide_to_safety", "Убедитесь, что они подготовили всё необходимое на случай, если вода поднимется."
).addOption(
	"Сообщил им о необходимости подготовиться.", "end_good"
).addOption(
	"Спасибо, это важно. Держу их в курсе.", "end_good"
).addOptionState( # ask_for_advice
	"ask_for_advice", "Сохраняйте спокойствие и переместитесь на самый высокий уровень вашего дома. Если есть возможность, подготовьте вещи первой необходимости."
).addOption(
	"Понял, уже иду наверх.", "move_to_highest_level"
).addOption(
	"Спасибо, буду готов.", "move_to_highest_level"
).addOptionState( # move_to_highest_level
	"move_to_highest_level", "Вы находитесь один или с кем-то ещё? Убедитесь, что все находятся в безопасности."
).addOption(
	"Я с семьей, все в порядке.", "check_family_safety"
).addOption(
	"Я один, но у меня есть домашние животные.", "check_pets_safety"
).addOptionState( # check_family_safety
	"check_family_safety", "Убедитесь, что все понимают план действий. Вы планируете оставаться на связи?"
).addOption(
	"Да, мой телефон заряжен и я на связи.", "stay_connected"
).addOption(
	"Да, мы подготовлены и ждем спасателей.", "stay_connected"
).addOptionState( # check_pets_safety
	"check_pets_safety", "Не забудьте взять с собой корм и воду для животных. Они должны быть с вами."
).addOption(
	"Уже все подготовил, спасибо.", "stay_connected"
).addOption(
	"Я позаботился о них, они со мной.", "stay_connected"
).addOptionState( # stay_connected
	"stay_connected", "Отлично, это поможет нам координировать наши действия и обеспечить вашу безопасность."
).addOption(
	"Спасибо, жду вашего сигнала.", "end_good"
).addOption(
	"Спасибо за поддержку, ждем спасателей.", "end_good"
).addOptionState( # ask_about_boats
	"ask_about_boats", "В данный момент спасательные лодки направляются в ваш район. Пожалуйста, оставайтесь на связи для дальнейших инструкций."
).addOption(
	"Буду ждать здесь, спасибо за информацию.", "end_good"
).addOption(
	"Хорошо, держите меня в курсе.", "end_good"
).addOptionState( # prepare_to_escape
	"prepare_to_escape", "Если вода поднимется ещё выше, перемещайтесь на крышу, но будьте осторожны с ветром."
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
	"end_good", "Вы следуете инструкциям оператора и безопасно ждете прибытия спасательной команды. Ваши действия помогли избежать опасности.", DialogData.EndResult.Win
).endStateBuilding()
