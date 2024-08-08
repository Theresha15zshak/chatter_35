const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_mine.png")

var data = DialogData.new(
	icon,
	"Тест по Minecraft",
	"Пройди тест по Minecraft"
).buildStates().addStartState([ # start
		"Привет! Готов пройти расширенный тест по Minecraft?", "Какое главное правило Minecraft?"
	]).addOption(
		"Не копать под себя", "start_2"
	).addOption(
		"Не приближаться к криперу", "end_bad"
	).addOption(
		"Не срубать первый блок дерева", "end_bad"
	).addOptionState( # start_2
		"start_2", "Какой самый редкий ресурс в Minecraft?"
	).addOption(
		"Рудное золото", "end_bad"
	).addOption(
		"Алмазы", "end_bad"
	).addOption(
		"Незеритовые обломки", "end_bad"
	).addOption(
		"Изумрудная руда", "start_3"
	).addOptionState( # start_3
		"start_3", "Какая броня дает больше защиты: кольчужная или золотая?"
	).addOption(
		"Кольчужная", "start_4"
	).addOption(
		"Золотая", "end_bad"
	).addOptionState( # start_4
		"start_4", "Какой моб Minecraft самый маленький?"
	).addOption(
		"Зомби", "end_bad"
	).addOption(
		"Камень", "end_bad"
	).addOption(
		"Чешуйница", "start_5"
	).addOption(
		"Кошка", "end_bad"
	).addOptionState( # start_5
		"start_5", "Какой моб Minecraft может заражать других мобов?"
	).addOption(
		"Зомби", "start_6"
	).addOption(
		"Дракон", "end_bad"
	).addOption(
		"Крипер", "end_bad"
	).addOptionState( # start_6
		"start_6", "Какой предмет необходим для портала в Энд?"
	).addOption(
		"Эндер жемчуг", "start_7"
	).addOption(
		"Алмаз", "end_bad"
	).addOption(
		"Золотое яблоко", "end_bad"
	).addOption(
		"Жемчуг эндера", "end_bad"
	).addOptionState( # start_7
		"start_7", "Какая структура генерируется в Незере?"
	).addOption(
		"Храм в джунглях", "end_bad"
	).addOption(
		"Бастион", "start_8"
	).addOption(
		"Деревня", "end_bad"
	).addOption(
		"Океанский монумент", "end_bad"
	).addOptionState( # start_8
		"start_8", "Какой блок необходим для создания железного голема?"
	).addOption(
		"Железный блок", "start_9"
	).addOption(
		"Каменный блок", "end_bad"
	).addOption(
		"Золотой блок", "end_bad"
	).addOption(
		"Деревянный блок", "end_bad"
	).addOptionState( # start_9
		"start_9", "Какой моб может телепортироваться?"
	).addOption(
		"Эндермен", "start_10"
	).addOption(
		"Скелет", "end_bad"
	).addOption(
		"Паук", "end_bad"
	).addOption(
		"Свинозомби", "end_bad"
	).addOptionState( # start_10
		"start_10", "Какой инструмент быстрее всего добывает землю?"
	).addOption(
		"Лопата", "start_11"
	).addOption(
		"Кирка", "end_bad"
	).addOption(
		"Топор", "end_bad"
	).addOption(
		"Мотыга", "end_bad"
	).addOptionState( # start_11
		"start_11", "Финальный вопрос. При прыжке на какой блок вы отпрыгните?"
	).addOption(
		"Слизневый блок", "end_good"
	).addOption(
		"Медовый блок", "end_bad"
	).addOption(
		"Полублок", "end_bad"
	).addEndState( # end_good
		"end_good", "Поздравляю! Вы прошли тест.", DialogData.EndResult.Win
	).addEndState( # end_bad
		"end_bad", "К сожалению, вы проиграли.", DialogData.EndResult.Lose
	).endStateBuilding()

