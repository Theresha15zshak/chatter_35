const DialogData = preload("res://assets/scripts/dialog_data.gd")
const icon = preload("res://assets/textures/profile_boss.png")

var data:DialogData = DialogData.new(
	icon,
	"Босс",
	"Получи повышение"
).buildStates().addStartState(
	"Здравствуйте!"
).addOption(
	"Здравствуйте, я хочу повышение.", "start2"
).addOptionState( # start2
	"start2", "Почему вы считаете, что заслуживаете повышение?"
).addOption(
	"Я хорошо показал себя в прошлом месяце и долго работаю в компании.", "goodwork"
).addOption(
	"Я принес компании большую прибыль своей работой.", "moneyzs"
).addOption(
	"Мне нужно повышение, иначе я уйду, так как я ценный сотрудник.", "end_good1", 0.59
).addOptionState( # goodwork
	"goodwork", "Да, но этого недостаточно для повышения."
).addOption(
	"Я очень хороший работник, благодаря мне была настроена работа команды.", "goodwork_team"
).addOption(
	"Я приношу неплохую прибыль!", "goodwork_money"
).addOption(
	"Я выполняю много задач и всегда готов помочь.", "dedication"
).addOptionState( # goodwork_team
	"goodwork_team", "Это не только ваша заслуга. Начальник сыграл большую роль."
).addOption(
	"Разве этого уже не достаточно, чтобы повысить меня?", "end_good1", 0.75
).addOption(
	"Без моей помощи, команда не достигла бы таких результатов.", "team_success"
).addOptionState( # team_success
	"team_success", "Ваш вклад значителен, но повышение требует более веских оснований."
).addOption(
	"Я также обучал новых сотрудников и внедрил эффективные методы работы.", "training"
).addOption(
	"Я разработал систему, которая улучшила продуктивность.", "productivity_system"
).addOptionState( # training
	"training", "Это действительно ценно. Обучение новых сотрудников важно для компании."
).addOption(
	"Так почему бы не повысить меня за мои усилия?", "end_good1", 0.85
).addOption(
	"Я также организовал тренинги, которые улучшили навыки команды.", "trainings"
).addOptionState( # trainings
	"trainings", "Это впечатляет. Но нам нужно больше времени, чтобы оценить результаты."
).addOption(
	"Я готов ждать и продолжать работать на благо компании.", "end_good1", 0.7
).addOption(
	"Мои усилия уже принесли видимые результаты.", "visible_results"
).addOptionState( # visible_results
	"visible_results", "Ваша работа действительно заметна. Мы рассмотрим ваше повышение."
).addOption(
	"Спасибо за понимание.", "end_good2"
).addOptionState( # goodwork_money
	"goodwork_money", "Прибыль важна, но не является единственным фактором."
).addOption(
	"Я также внедрил эффективные методы работы, которые улучшили производительность.", "productivity_methods"
).addOption(
	"Я всегда готов помочь коллегам и поддерживать команду.", "team_support"
).addOptionState( # productivity_methods
	"productivity_methods", "Это хороший аргумент. Мы ценим ваши усилия."
).addOption(
	"Благодаря моим методам, компания сэкономила много времени и ресурсов.", "time_saving"
).addOption(
	"Я могу продолжать улучшать процессы в компании.", "process_improvement"
).addOptionState( # time_saving
	"time_saving", "Экономия времени и ресурсов - это всегда плюс."
).addOption(
	"Так почему бы не повысить меня за мои достижения?", "end_good2", 0.8
).addOption(
	"Я также готов предложить новые идеи для дальнейшего улучшения.", "new_ideas"
).addOptionState( # new_ideas
	"new_ideas", "Ваш энтузиазм вдохновляет. Мы рассмотрим ваше предложение."
).addOption(
	"Спасибо за возможность!", "end_good1", 0.9
).addOptionState( # team_support
	"team_support", "Поддержка команды важна, но что еще вы можете предложить?"
).addOption(
	"Я обучал новых сотрудников и внедрял новые процессы.", "training"
).addOption(
	"Я разработал систему для улучшения продуктивности.", "productivity_system"
).addOptionState( # productivity_system
	"productivity_system", "Эффективные системы работы всегда ценны."
).addOption(
	"Благодаря этой системе, работа стала более организованной.", "organized_work"
).addOption(
	"Система помогла улучшить качество работы всей команды.", "team_quality"
).addOptionState( # organized_work
	"organized_work", "Организация работы - ключ к успеху."
).addOption(
	"Так почему бы не повысить меня за эти усилия?", "end_good1", 0.85
).addOptionState( # team_quality
	"team_quality", "Улучшение качества работы команды - это весомый аргумент."
).addOption(
	"Спасибо за признание моих усилий!", "end_good1", 0.9
).addOptionState( # moneyzs
	"moneyzs", "Прибыль важна, но нужно быть не только прибыльным."
).addOption(
	"Я также неплохо сработался с командой.", "teamwork"
).addOption(
	"Деньги решают многое в бизнесе.", "money_talks"
).addOptionState( # teamwork
	"teamwork", "Хорошие отношения в команде важны."
).addOption(
	"Я помогаю коллегам и способствую развитию компании.", "end_good1", 0.8
).addOption(
	"Благодаря моим усилиям, работа команды улучшилась.", "team_improvement"
).addOptionState( # team_improvement
	"team_improvement", "Улучшение работы команды - это значительный вклад."
).addOption(
	"Спасибо за внимание к моим достижениям!", "end_good1", 0.9
).addOptionState( # money_talks
	"money_talks", "Деньги решают многое, но не всё."
).addOption(
	"Я также внедрил новые методы работы для повышения эффективности.", "efficiency_methods"
).addOption(
	"Мои усилия помогают компании расти.", "company_growth"
).addOptionState( # efficiency_methods
	"efficiency_methods", "Эффективность важна для любой компании."
).addOption(
	"Благодаря моим методам, мы достигли значительных успехов.", "end_good1", 0.85
).addOption(
	"Я могу продолжать улучшать наши процессы.", "process_improvement"
).addOptionState( # company_growth
	"company_growth", "Рост компании - это всегда хорошо."
).addOption(
	"Так почему бы не повысить меня за мой вклад?", "end_good1", 0.8
).addOption(
	"Я готов предложить новые идеи для дальнейшего роста.", "new_ideas"
).addOptionState( # dedication
	"dedication", "Ваше стремление помогать ценно для нас."
).addOption(
	"Я также участвую в разработке новых проектов.", "new_projects"
).addOption(
	"Я всегда готов работать сверхурочно для достижения целей.", "overtime"
).addOptionState( # new_projects
	"new_projects", "Новые проекты важны для развития компании."
).addOption(
	"Мои проекты уже показали хорошие результаты.", "end_good1", 0.85
).addOption(
	"Я могу предложить еще больше новых идей.", "new_ideas"
).addOptionState( # overtime
	"overtime", "Работа сверхурочно - это большой плюс."
).addOption(
	"Я готов работать еще усерднее, если получу повышение.", "end_good15", 0.75
).addOption(
	"Мои усилия уже приносят пользу компании.", "visible_results"
).addEndState( # end_good1
	"end_good1", "Начальник вам поверил", DialogData.EndResult.Win
).addEndState( # end_good2
	"end_good2", "Начальник вам поверил и рассматривает ваше повышение", DialogData.EndResult.Win
).addEndState( # end_bad
	"end_bad", "Начальник вам не поверил", DialogData.EndResult.Lose
).endStateBuilding()

