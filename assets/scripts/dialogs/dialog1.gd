const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_mine.png")

var data = DialogData.new(
	icon,
	"Тест по майнкрафту",
	"Пройди тест по майнкрафту"
).buildStates().addStartStateWithMultipleText([ # start
		"Привет! Пройди тест по майнкрафту", "Какое главное правило майнкрафта?"
	]).addOption(
		"Не копать под себя", "start_2"
	).addOption(
		"Не приближатся к криперу", "end_bad"
	).addOption(
		"Не срубать первый блок дерева", "end_bad"
	).addOptionState( # start_2
		"start_2", "Какой самый редкий ресурс в майнкрафте?"
	).addOption(
		"Рудное золото", "end_bad"
	).addOption(
		"Алмазы", "end_bad"
	).addOption(
		"Незеритовые обломки", "end_bad"
	).addOption(
		"Изумрудная руда", "start_3"
	).addOptionState( #start_3
		"start_3", "Какая броня дает больше защиты кольчужная или золотая?"
	).addOption(
		"Кольчужная", "start_4"
	).addOption(
		"Золотая", "end_bad"
	).addOptionState( #start_4
		"start_4", "Какой моб майнкрафта самый маленький?"
	).addOption(
		"Зомби", "end_bad"
	).addOption(
		"Камень", "end_bad"
	).addOption(
		"Чешуйница", "start_5"
	).addOption(
		"Кошка", "end_bad"
	).addOptionState( #start_5
		"start_5", "Какой моб майнкрафта может заражать других мобов?"
	).addOption(
		"Зомби", "start_6"
	).addOption(
		"Дракон", "end_bad"
	).addOption(
		"Крипер", "end_bad"
	).addOptionState( #start_6
		"start_6", "Финальный вопрос. При прыжке на какой блок вы отпрыгните?"
	).addOption(
		"Слизневый блок", "end_good"
	).addOption(
		"Медовый блок", "end_bad"
	).addOption(
		"Полублок", "end_bad"
	).addEndState( #end_good
		"end_good", "Поздравляю! Вы прошли тест.", DialogData.EndResult.Win
	).addEndState( #end_bad
		"end_bad", "К сожалению вы проиграли", DialogData.EndResult.Lose
	).endStateBuilding()
