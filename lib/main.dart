import 'package:televerse/televerse.dart';

/// Creates the bot instance
final bot = Bot('7671338190:AAEQyuiOubK1sZJ1zUOVxLXU7CUDZA9yajI',
    fetcher: LongPolling.allUpdates(),
    timeout: Duration(
      seconds: 5,
    ));

// Create the menu
// Data в меню не может иметь заглавные буквы - Error
final startMenu = InlineMenu(name: "Start Menu")
    .text("Способы подачи документов", sposobPadichiCallBack,
        data: 'podachadocumentov')
    .row()
    .text("Документы для поступления", documentCallBack,
        data: 'documentdlypostypleniya')
    .row()
    // .text("О целевом обучении (в разработке)", celevoeObychenieCallBack,
    //     data: 'celevoeobychenie')
    // .row()
    .text("Сроки подачи документов", srokipodachidocumentovCallBack,
        data: 'srokipodachidocumentov')
    .row()
    .text("Контакты", kontaktyCallBack, data: 'kontakty')
    .row()
    .text("Общий чат", obshiichatCallBack, data: 'obshichat');

// Переход в главное меню

final glavnoeMenu = InlineMenu(name: "Glavnoe Menu")
    .text("✏️Главное меню ", sposobPadichiCallBack, data: 'podachadocumentov')
    .row();

final celevoeMenu = InlineMenu(name: "Celevoe Menu").text(
    "Что такое целевое обучение?", sposobPadichiCallBack,
    data: 'celevoeobychenit');

/// Подгрузка бота
void main() async {
  // Начала бота
  bot.attachMenu(startMenu);

  // Старт
  bot.command('start', (ctx) {
    // Reply with the menu
    ctx.reply(
      "Привет! 👋 Я – официальный бот Центральной приемной комиссии ППТ.  У меня ты можешь узнать главную информацию о поступлении в наш Техникум 👇",
      replyMarkup: startMenu,
    );
  });

  // Start the bot and listen for updates
  await bot.start();
  bot.onError((err) {
    print('Ошибка - start');
    print(err.error);
    print(err.stackTrace);
    print('Ошибка - End');
    bot.start();
  });
}

// void perexodVglanvoeCallBack

Future<void> sposobPadichiCallBack(Context ctx) async {
  await ctx.editMessageText(
    """<b>Способы подачи документов:</b>  \n
📌Лично в Центральную приемную комиссию или в отборочные комиссии факультетов.\n
📌Адреса доступны на сайте ППТ в разделе <a href="https://www.ppt52.ru/kontakty1.html">"Поступающему"</a>\n 
📌Единый портал государственных услуг \n
📌Почтой России (куда: 607762, Нижегородская область, город Первомайск, улица Юбилейная, дом 24) """,
    parseMode: ParseMode.html,
    replyMarkup: startMenu,
  );

  // Удаление меню, после нажатия
  // bot.removeMenu(startMenu);
}

// Документы для поступления
Future<void> documentCallBack(Context ctx) async {
  await ctx.editMessageText(
    """<b>Документы для поступления:</b>  \n
1. <b>Заявление о поступлении</b> - заполняется в установленной форме.
2. <b>Аттестат об основном общем образовании или о среднем общем образовании</b> - копия или оригинал.
3. <b>Справка об успешном окончании 9-го или 11-го класса</b> (при необходимости).
4. <b>Удостоверение личности - паспорт</b> (или свидетельство о рождении для лиц младше 14 лет).
5. <b>Медицинская справка</b> - о состоянии здоровья .
6. <b>Фотографии</b> - паспортные фотографии (количество уточнить в учебном заведении).
7. <b>Документы, подтверждающие льготы (если есть)</b> - для поступления на льготных условиях.
""",
    parseMode: ParseMode.html,
    replyMarkup: startMenu,
  );

  // Удаление меню, после нажатия
  // bot.removeMenu(startMenu);
}

// Целевое обучение
Future<void> celevoeObychenieCallBack(Context ctx) async {
  print(ctx.id.id);
  await ctx.reply(
    """<b>Целевое обучение:</b>  \n
Крутой нас """,
    parseMode: ParseMode.html,
    replyMarkup: celevoeMenu,
  );
  bot.removeMenu(startMenu);
  // Удаление меню, после нажатия
}

// Сроки подачи документов

Future<void> srokipodachidocumentovCallBack(Context ctx) async {
  await ctx.editMessageText(
    """<b>Сроки подачи документов:</b>  \n
✏️ Прием документов на очную, очно-заочную формы обучения
начинается <b>20 июня 2024 г.</b>
✏️ Прием документов на очную форму обучения завершается <b>15 августа 2024г.</b>
✏️ При наличии свободных мест в Техникуме прием документов на очную
форму обучения продлевается до <b>25 ноября 2024 г.</b>
✏️ Прием документов на очно-заочную форму обучения завершается <b>30
августа 2024 г.</b>
✏️ При наличии свободных мест прием документов на очно-заочную форму
обучения осуществляется до <b>1 декабря 2024 г.</b> включительно.
""",
    parseMode: ParseMode.html,
    replyMarkup: startMenu,
  );
  // bot.removeMenu(startMenu);
  // Удаление меню, после нажатия
}

// Контакты

Future<void> kontaktyCallBack(Context ctx) async {
  await ctx.editMessageText(
    """<b>Контакты:</b>  \n
🏡 Место нахождения/почтовый адрес: 607762, Нижегородская область, город Первомайск, улица Юбилейная, дом 24 \n
📞 Телефон/Факс: (83139) 2-33-13, 2-33-23 \n
✉️ Адрес электронной почты: ppt_suz@mail.52gov.ru \n
⏰ График работы: \n Понедельник - пятница с 8.00 до 16.30(перерыв с 12.00 до 12.30) \n Суббота с 8.00 до 12.30; Воскресенье - выходной
Социальные сети: 
⭐️ Мы - <a href="https://vk.com/club32513641">"ВКонтакте"</a>
⭐️ Мы - <a href="https://t.me/+LJqOBeoBssg3Mzgy">"Общий чат (Телеграм)"</a>
""",
    parseMode: ParseMode.html,
    replyMarkup: startMenu,
  );
  // bot.removeMenu(startMenu);
  // Удаление меню, после нажатия
}

// Общий чат
Future<void> obshiichatCallBack(Context ctx) async {
  await ctx.editMessageText(
    """<b>Общий чат:</b>  \n
<a href="https://t.me/+LJqOBeoBssg3Mzgy">"Вступить в общий чат"</a>
""",
    parseMode: ParseMode.html,
    replyMarkup: startMenu,
  );
  // bot.removeMenu(startMenu);
  // Удаление меню, после нажатия
}

// When a user clicks on the "Second" button, the bot will edit the message
// with "How was that?"
void finishCallback(Context ctx) async {
  await ctx.editMessageText("How was that?");

  // Removes the menu listeners from the bot
  bot.removeMenu(startMenu);
}
