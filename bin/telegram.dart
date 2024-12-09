import 'dart:io';
import 'package:televerse/televerse.dart';

var intButton = 0;

/// Creates the bot instance
final bot = Bot('7671338190:AAEQyuiOubK1sZJ1zUOVxLXU7CUDZA9yajI',
    fetcher: LongPolling.allUpdates(),
    timeout: Duration(
      seconds: 5,
    ));

// Чтение из файлов
// Технология Машинстроения
Future<String> readTexnologiOchnay() async {
  final file = File('bin/value/texnologiiMashinoStroeniya.txt');
  String contents = await file.readAsString();
  return contents;
}

// Оператор Наладчик
Future<String> readOpertorNaladchik() async {
  final file = File('bin/value/operatorNaladchik.txt');
  String contents = await file.readAsString();
  return contents;
}

// ЭлектроМонтер
Future<String> readElectroMonter() async {
  final file = File('bin/value/electromonter.txt');
  String contents = await file.readAsString();
  return contents;
}
// Технология Машинстроение на базе Среднего

// ЭлектроМонтер
Future<String> readElectroMonterSrednee() async {
  final file = File('bin/value/texnologiSrednee.txt');
  String contents = await file.readAsString();
  return contents;
}

// Create the menu
// Data в меню не может иметь заглавные буквы - Error
final startMenu = InlineMenu(name: "Start Menu")
    .text("Способы подачи документов", sposobPadichiCallBack,
        data: 'podachadocumentov')
    .row()
    .text("Документы для поступления", documentCallBack,
        data: 'documentdlypostypleniya')
    .row()
    .text("Направления подготовки", napravlenieCallBack,
        data: 'napravlenieCallBack')
    .row()
    .text("Сроки подачи документов", srokipodachidocumentovCallBack,
        data: 'srokipodachidocumentov')
    .row()
    .text("Контакты", kontaktyCallBack, data: 'kontakty')
    .row()
    .text("Общий чат", obshiichatCallBack, data: 'obshichat')
    .row()
    .text(
      "Редактировать",
      redactirovatCallBack,
      data: 'redactirovat',
    );

// Переход в главное меню

final adminMenu = InlineMenu(name: "adminMenu")
    .text("🔼Главное меню ", kontaktyCallBack, data: 'kontakty')
    .row();

/// Подгрузка бота
void main() async {
  // Начала бота

  bot.attachMenu(startMenu);

  // Старт
  bot.command('start', (ctx) {
    print(ctx.from?.firstName);
    print(ctx.from?.lastName);
    print(ctx.from?.username == 'Denup98');
    ctx.deleteMessage();
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

    main();
  });
}

// void perexodVglanvoeCallBack

Future<void> sposobPadichiCallBack(Context ctx) async {
  print(ctx.from?.firstName);
  print(ctx.from?.lastName);
  print(ctx.from?.username);

  try {
    await ctx.editMessageText(
      """<b>Способы подачи документов:</b>  \n
📌Лично в Центральную приемную комиссию.\n
📌Адреса доступны на сайте ППТ в разделе <a href="https://www.ppt52.ru/kontakty1.html">"Поступающему"</a>\n 
📌Единый портал государственных услуг \n
📌Почтой России (куда: 607762, Нижегородская область, город Первомайск, улица Юбилейная, дом 24) """,
      parseMode: ParseMode.html,
      replyMarkup: startMenu,
    );

    // Удаление меню, после нажатия
    // bot.removeMenu(startMenu);
  } catch (e) {
    print('Ошибка - $e');
  }
}

// Документы для поступления
Future<void> documentCallBack(Context ctx) async {
  try {
    await ctx.editMessageText(
      """<b>Документы для поступления:</b>  \n
1. <b>Заявление о поступлении</b> - заполняется в установленной форме.
2. <b>Аттестат об основном общем образовании или о среднем общем образовании</b> - копия или оригинал.
3. <b>Справка об успешном окончании 9-го или 11-го класса</b> (при необходимости).
4. <b>Удостоверение личности - паспорт</b> (или свидетельство о рождении для лиц младше 14 лет).
5. <b>Медицинская справка</b> - о состоянии здоровья .
6. <b>Фотографии</b> - паспортные фотографии (4 шт.).
7. <b>СНИЛС</b> - оригинал или копию документа о страховом номере индивид. лиц. счета  
""",
      parseMode: ParseMode.html,
      replyMarkup: startMenu,
    );
    await ctx.replyWithDocument(InputFile.fromFile(
        File('bin/Правила_приема_на_2024_2025_учебный_год.pdf')));
  } catch (e) {
    print('Ошибка - $e');
  }
  // Удаление меню, после нажатия
  // bot.removeMenu(startMenu);
}

// Сроки подачи документов

Future<void> srokipodachidocumentovCallBack(Context ctx) async {
  try {
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
  } catch (e) {
    print('Ошибка - $e');
  }
}

// Контакты

Future<void> kontaktyCallBack(Context ctx) async {
  try {
    await ctx.editMessageText(
      """<b>Контакты:</b>  \n
🏡 Место нахождения/почтовый адрес: 607762, Нижегородская область, город Первомайск, улица Юбилейная, дом 24 \n
📞 Телефон/Факс: (83139) 2-33-13, 2-33-23 \n
📌 Оффициальный сайт: https://ppt52.ru/ \n
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
  } catch (e) {
    print('Ошибка - $e');
  }
}

// Общий чат
Future<void> obshiichatCallBack(Context ctx) async {
  try {
    await ctx.editMessageText(
      """<b>В этом чате вы можете задавать вопросы, которые вас интересуют:</b>  \n
<a href="https://t.me/+LJqOBeoBssg3Mzgy">"Вступить в общий чат"</a>
""",
      parseMode: ParseMode.html,
      replyMarkup: startMenu,
    );
    // bot.removeMenu(startMenu);
    // Удаление меню, после нажатия
  } catch (e) {
    print('Ошибка - $e');
  }
}

// Направление образования

Future<void> napravlenieCallBack(Context ctx) async {
  try {
    await ctx.editMessageText(
      """<b>Направления подготовки :</b>  \n
<b>Программа подготовки специалистов среднего звена на базе основного общего образования (очная форма обучения)</b>
✏️ 15.02.16 Технология машиностроения (ПРОФЕССИОНАЛИТЕТ) \n
<b>Программы подготовки квалифицированных рабочих(служащих) на базе основного общего образования (очная форма обучения)</b>
✏️ 15.01.38 Оператор-наладчик металлообрабатывающих станков (ПРОФЕССИОНАЛИТЕТ)
✏️ 13.01.10 Электромонтер по ремонту и обслуживанию электрооборудования (по отраслям) \n
<b>Программы подготовки специалистов среднего звена на базе среднего общего образования (очно-заочная форма обучения)</b>
✏️ 15.02.16 Технология машиностроения (ПРОФЕССИОНАЛИТЕТ) 
""",
      parseMode: ParseMode.html,
      replyMarkup: startMenu,
    );
    // bot.removeMenu(startMenu);
    // Удаление меню, после нажатия
  } catch (e) {
    print('Ошибка - $e');
  }
}

Future<void> redactirovatCallBack(Context ctx) async {
  // final machino = ;
  if (ctx.from?.username != 'Denup98') {
    ctx.answerCallbackQuery(text: "У вас нет прав для редактирования! 😢");
  } else {
    try {
      final texnologiOchnay = await readTexnologiOchnay();
      final operatorNaladchik = await readOpertorNaladchik();
      final electroMonter = await readElectroMonter();
      final electroMonterSrednee = await readElectroMonterSrednee();
      await ctx.editMessageText(
        """<b>Панель администратора :</b>  \n
✏ Технология машиностроения (ПРОФЕССИОНАЛИТЕТ) очная - <b> $texnologiOchnay  заявки</b> \n
✏ Оператор-наладчик металлообрабатывающих станков (ПРОФЕССИОНАЛИТЕТ) - <b> $operatorNaladchik  заявки</b> \n
✏ Электромонтер по ремонту и обслуживанию электрооборудования - <b> $electroMonter  заявки</b> \n
✏ Технология машиностроения (ПРОФЕССИОНАЛИТЕТ) <b>на базе Среднего</b> -  <b> $electroMonterSrednee  заявки</b>
""",
        parseMode: ParseMode.html,
        replyMarkup: adminMenu,
      );
      // bot.removeMenu(startMenu);
      // Удаление меню, после нажатия
    } catch (e) {
      print('Ошибка - $e');
    }
  }
}

// When a user clicks on the "Second" button, the bot will edit the message
// with "How was that?"
void finishCallback(Context ctx) async {
  await ctx.editMessageText("How was that?");

  // Removes the menu listeners from the bot
  bot.removeMenu(startMenu);
}
