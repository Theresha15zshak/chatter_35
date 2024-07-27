const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_courier.png")

var data:DialogData = DialogData.new(
	icon,
	"Курьер",
	"Получите доставку еды"
).buildStates().addStartState(
	"Здравствуйте! Я курьер и не могу найти ваш дом."
).addOption(
	"Какой курьер?", "what"
).addOption(
	"Где вы сейчас?", "where"
).addOptionState( # what
	"what", "Вы заказывали доставку еды на сайте."
).addOption(
	"Вспомнил! Где вы сейчас?", "where"
).addOption(
	"Не помню такого. Возможно, вы ошиблись.", "end_bad"
).addOptionState( # where
	"where", "Я возле метро, здесь все замело снегом."
).addOption(
	"Какая станция метро?", "searching"
).addOption(
	"Попробуйте найти дорогу через карту. (Риск)", "risk_path"
).addOptionState( # searching
	"searching", "Станция метро Новокузнецкая."
).addOption(
	"Пройдите через лес по тропинке, она приведет вас к двору.", "forest"
).addOptionState( # forest
	"forest", "Я в лесу. Здесь много тропинок. Куда идти дальше?"
).addOption(
	"Идите прямо, пока не увидите старый колодец, затем налево.", "well"
).addOption(
	"Сверните направо на первой развилке, потом снова направо.", "wrong_way"
).addOptionState( # well
	"well", "Я нашел колодец. Что теперь?"
).addOption(
	"От колодца идите налево до конца тропинки.", "searching2"
).addOption(
	"Пройдите мимо колодца и сверните направо.", "lost"
).addOptionState( # wrong_way
	"wrong_way", "Я заблудился. Здесь нет выхода."
).addOption(
	"Вернитесь к началу леса и попробуйте снова.", "forest"
).addOption(
	"Попробуйте найти кого-то для помощи.", "end_bad"
).addOptionState( # lost
	"lost", "Я снова потерялся. Не вижу ориентиров."
).addOption(
	"Вернитесь к колодцу и следуйте инструкциям заново.", "well"
).addOption(
	"Ну сделайте что-нибудь", "end_bad"
).addOptionState( # searching2
	"searching2", "Я вижу жилой район. Куда дальше?"
).addOption(
	"Идите к большому красному зданию, затем налево.", "residential"
).addOption(
	"Ищите 5-й подъезд в синем доме.", "residential2"
).addOptionState( # residential
	"residential", "Я у красного здания. Где ваш дом?"
).addOption(
	"Продолжайте идти налево до 5-го подъезда.", "finded_path"
).addOption(
	"Вы ошиблись. Вернитесь назад.", "searching2"
).addOptionState( # residential2
	"residential2", "Я у синего дома. Нашел 5-й подъезд."
).addOption(
	"Отлично, заходите в 5-й подъезд.", "finded_path"
).addOption(
	"Это не тот дом.", "searching2"
).addOptionState( # risk_path
	"risk_path", "Попробую использовать карту, но здесь плохая видимость."
).addOption(
	"Осторожно следуйте указаниям карты.", "searching"
).addOption(
	"Вернитесь к метро и попробуйте другой путь.", "searching"
).addOptionState( # finded_path
	"finded_path", "Отлично, я нашел ваш дом. Скоро буду с вашей едой!"
).addOption(
	"Отлично, жду вас!", "end_good"
).addEndState( # end_bad
	"end_bad", "Вы остались без еды.", DialogData.EndResult.Lose
).addEndState( # end_good
	"end_good", "Скоро прибудет ваша вкусная еда.", DialogData.EndResult.Win
).endStateBuilding()
