import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_ru.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @portfolio.
  ///
  /// In ru, this message translates to:
  /// **'Портфолио'**
  String get portfolio;

  /// No description provided for @yourName.
  ///
  /// In ru, this message translates to:
  /// **'Никита Баранцев'**
  String get yourName;

  /// No description provided for @yourJob.
  ///
  /// In ru, this message translates to:
  /// **'Flutter Developer'**
  String get yourJob;

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'brntsv.n@gmail.com'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In ru, this message translates to:
  /// **'+7 913 017 65 94'**
  String get phone;

  /// No description provided for @location.
  ///
  /// In ru, this message translates to:
  /// **'Новосибирск, Россия'**
  String get location;

  /// No description provided for @telegramUrl.
  ///
  /// In ru, this message translates to:
  /// **'Telegram: [@bntsv](https://t.me/bntsv)'**
  String get telegramUrl;

  /// No description provided for @githubUrl.
  ///
  /// In ru, this message translates to:
  /// **'GitHub: [brntsv](https://github.com/brntsv)'**
  String get githubUrl;

  /// No description provided for @aboutMe.
  ///
  /// In ru, this message translates to:
  /// **'Обо мне'**
  String get aboutMe;

  /// No description provided for @aboutMeDesc.
  ///
  /// In ru, this message translates to:
  /// **'Делаю мобильные приложения устойчивыми, понятными и готовыми к росту. Умею с нуля запускать MVP, продумывать архитектуру и требования вместе с командой, автоматизировать сборки и улучшать продукт за счёт метрик, UX и производительности.'**
  String get aboutMeDesc;

  /// No description provided for @projects.
  ///
  /// In ru, this message translates to:
  /// **'Проекты'**
  String get projects;

  /// No description provided for @experience.
  ///
  /// In ru, this message translates to:
  /// **'Опыт работы'**
  String get experience;

  /// No description provided for @flourAndOrderPeriod.
  ///
  /// In ru, this message translates to:
  /// **'март 2025 — ноябрь 2025'**
  String get flourAndOrderPeriod;

  /// No description provided for @flourAndOrderPosition.
  ///
  /// In ru, this message translates to:
  /// **'Flutter Developer в Muka Team'**
  String get flourAndOrderPosition;

  /// No description provided for @flourAndOrderResponsibilityItem1.
  ///
  /// In ru, this message translates to:
  /// **'Архитектура и разработка MVP: слои приложения, стек пакетов, ui_kit;'**
  String get flourAndOrderResponsibilityItem1;

  /// No description provided for @flourAndOrderResponsibilityItem2.
  ///
  /// In ru, this message translates to:
  /// **'Планирование фич и проработка требований: поиск и закрытие пробелов в ТЗ и UX-сценариях;'**
  String get flourAndOrderResponsibilityItem2;

  /// No description provided for @flourAndOrderResponsibilityItem3.
  ///
  /// In ru, this message translates to:
  /// **'Интеграция платежей, push-уведомлений, метрик и сторонних сервисов;'**
  String get flourAndOrderResponsibilityItem3;

  /// No description provided for @flourAndOrderResponsibilityItem4.
  ///
  /// In ru, this message translates to:
  /// **'Настройка сборок, окружений и релизов (Makefile + fastlane, сторы);'**
  String get flourAndOrderResponsibilityItem4;

  /// No description provided for @flourAndOrderResponsibilityItem5.
  ///
  /// In ru, this message translates to:
  /// **'Качество и UX: обработка сетевых ошибок, шиммеры и подсказки для пользователей.'**
  String get flourAndOrderResponsibilityItem5;

  /// No description provided for @flourAndOrderAchievementItem1.
  ///
  /// In ru, this message translates to:
  /// **'Запустил MVP «Мука и Порядок» с нуля и довёл до публикации в App Store, Google Play, RuStore и AppGallery;'**
  String get flourAndOrderAchievementItem1;

  /// No description provided for @flourAndOrderAchievementItem2.
  ///
  /// In ru, this message translates to:
  /// **'Спроектировал масштабируемую архитектуру с ui_kit, упростив дальнейшее развитие продукта;'**
  String get flourAndOrderAchievementItem2;

  /// No description provided for @flourAndOrderAchievementItem3.
  ///
  /// In ru, this message translates to:
  /// **'Автоматизировал сборки и релизы через Makefile + fastlane, сократив время вывода версий;'**
  String get flourAndOrderAchievementItem3;

  /// No description provided for @flourAndOrderAchievementItem4.
  ///
  /// In ru, this message translates to:
  /// **'Добавил шиммер‑скелетоны и анимированные подсказки, улучшив онбординг и вовлечённость пользователей;'**
  String get flourAndOrderAchievementItem4;

  /// No description provided for @flourAndOrderAchievementItem5.
  ///
  /// In ru, this message translates to:
  /// **'Реализовал контроль соединения (internet_connection_checker + интерсептор) для обработки сетевых ошибок.'**
  String get flourAndOrderAchievementItem5;

  /// No description provided for @app.
  ///
  /// In ru, this message translates to:
  /// **'Приложение:'**
  String get app;

  /// No description provided for @projectsMuka.
  ///
  /// In ru, this message translates to:
  /// **'— Мука и Порядок [RuStore](https://www.rustore.ru/catalog/app/com.flour.order)'**
  String get projectsMuka;

  /// No description provided for @nanAgencyPeriod.
  ///
  /// In ru, this message translates to:
  /// **'май 2023 — наст. вр.'**
  String get nanAgencyPeriod;

  /// No description provided for @nanAgencyPosition.
  ///
  /// In ru, this message translates to:
  /// **'Flutter Developer в NaN Agency'**
  String get nanAgencyPosition;

  /// No description provided for @responsibilities.
  ///
  /// In ru, this message translates to:
  /// **'Обязанности:'**
  String get responsibilities;

  /// No description provided for @nanAgencyResponsibilityItem1.
  ///
  /// In ru, this message translates to:
  /// **'Архитектура и дизайн MVP/фич: слои приложения, стек пакетов, ui_kit;'**
  String get nanAgencyResponsibilityItem1;

  /// No description provided for @nanAgencyResponsibilityItem2.
  ///
  /// In ru, this message translates to:
  /// **'Проработка требований и API вместе с бэкендом: договаривался о форматах данных, сценариях ошибок и интеграции со сторонними сервисами;'**
  String get nanAgencyResponsibilityItem2;

  /// No description provided for @nanAgencyResponsibilityItem3.
  ///
  /// In ru, this message translates to:
  /// **'Разработка сложных интерфейсов и доменных фич (схемы строительных объектов, каталог, корзина, поиск, карты);'**
  String get nanAgencyResponsibilityItem3;

  /// No description provided for @nanAgencyResponsibilityItem4.
  ///
  /// In ru, this message translates to:
  /// **'Производительность и стабильность: профилирование, оптимизация, снижение количества падений;'**
  String get nanAgencyResponsibilityItem4;

  /// No description provided for @nanAgencyResponsibilityItem5.
  ///
  /// In ru, this message translates to:
  /// **'Сборки и релизы: окружения, автоматизация (Makefile, fastlane, GitLab CI/CD), публикации в сторы.'**
  String get nanAgencyResponsibilityItem5;

  /// No description provided for @achievements.
  ///
  /// In ru, this message translates to:
  /// **'Достижения:'**
  String get achievements;

  /// No description provided for @nanAgencyAchievementItem1.
  ///
  /// In ru, this message translates to:
  /// **'Повысил crash-free с ~59% до 99% (AppMetrica), устранив критические падения;'**
  String get nanAgencyAchievementItem1;

  /// No description provided for @nanAgencyAchievementItem2.
  ///
  /// In ru, this message translates to:
  /// **'Спроектировал и реализовал MVP с нуля, заложив масштабируемую архитектуру;'**
  String get nanAgencyAchievementItem2;

  /// No description provided for @nanAgencyAchievementItem3.
  ///
  /// In ru, this message translates to:
  /// **'Реализовал ключевые визуальные фичи для недвижимости: шахматку, экран этажей и интерактивный генплан на базе CustomPainter;'**
  String get nanAgencyAchievementItem3;

  /// No description provided for @nanAgencyAchievementItem4.
  ///
  /// In ru, this message translates to:
  /// **'Ускорил визуальную загрузку экранов за счёт оптимизации загрузки/кеширования изображений и ввода шиммер‑скелетонов;'**
  String get nanAgencyAchievementItem4;

  /// No description provided for @nanAgencyAchievementItem5.
  ///
  /// In ru, this message translates to:
  /// **'Настроил GitLab CI/CD и автоматизированные релизы (Makefile + fastlane), сократив время вывода новых версий;'**
  String get nanAgencyAchievementItem5;

  /// No description provided for @nanAgencyAchievementItem6.
  ///
  /// In ru, this message translates to:
  /// **'Интегрировал SearchBooster и DaData, усилив поиск по каталогу и работу с формами.'**
  String get nanAgencyAchievementItem6;

  /// No description provided for @nanAgencyProjects.
  ///
  /// In ru, this message translates to:
  /// **'Проекты, на которых работал продолжительное время:'**
  String get nanAgencyProjects;

  /// No description provided for @projectsRealtOne.
  ///
  /// In ru, this message translates to:
  /// **'— Realt One [App Store](https://apps.apple.com/us/app/realt-one/id6742776096) | [Google Play](https://play.google.com/store/apps/details?id=com.realtone.realt_one&hl=RU)'**
  String get projectsRealtOne;

  /// No description provided for @projectsNovex.
  ///
  /// In ru, this message translates to:
  /// **'— Novex [App Store](https://apps.apple.com/ru/app/n%D0%BEvex-%D0%B4%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%B0%D0%BA%D1%86%D0%B8%D0%B8/id1608874837) | [Google Play](https://play.google.com/store/apps/details?id=com.creonit.novex&hl=RU)'**
  String get projectsNovex;

  /// No description provided for @skills.
  ///
  /// In ru, this message translates to:
  /// **'Навыки'**
  String get skills;

  /// No description provided for @skillsList.
  ///
  /// In ru, this message translates to:
  /// **'Dart   Flutter   flutter_bloc   dio   retrofit   auto_route   get_it   injectable   rxdart   EventBus    drift    build_runner    json_annotation    freezed   AppLinks   Push Notifications    flavors   fastlane   Makefile   GitLab CI/CD   mason   Firebase    analysis_options   Animations   geolocator   geodesy   fvm   git'**
  String get skillsList;

  /// No description provided for @education.
  ///
  /// In ru, this message translates to:
  /// **'Образование'**
  String get education;

  /// No description provided for @educationInstitution.
  ///
  /// In ru, this message translates to:
  /// **'СГУПС (г. Новосибирск)'**
  String get educationInstitution;

  /// No description provided for @educationDegree.
  ///
  /// In ru, this message translates to:
  /// **'Инженер путей сообщения'**
  String get educationDegree;

  /// No description provided for @educationYears.
  ///
  /// In ru, this message translates to:
  /// **'2014 - 2019 уч. гг.'**
  String get educationYears;

  /// No description provided for @languages.
  ///
  /// In ru, this message translates to:
  /// **'Языки'**
  String get languages;

  /// No description provided for @languageEnglish.
  ///
  /// In ru, this message translates to:
  /// **'Английский - Intermediate / B1'**
  String get languageEnglish;

  /// No description provided for @languageRussian.
  ///
  /// In ru, this message translates to:
  /// **'Русский - Native'**
  String get languageRussian;

  /// No description provided for @aboutMeBlog.
  ///
  /// In ru, this message translates to:
  /// **'Привет! Я Никита, Flutter разработчик. Здесь делюсь проектами и заметками о том, что меня вдохновляет. Помимо Flutter интересуюсь Rust.'**
  String get aboutMeBlog;

  /// No description provided for @cv.
  ///
  /// In ru, this message translates to:
  /// **'Резюме'**
  String get cv;

  /// No description provided for @blogFooterDesc.
  ///
  /// In ru, this message translates to:
  /// **'Этот сайт создан на Flutter Web, хостинг на Firebase. [Код доступен](https://github.com/brntsv/flutter_web_cv_portfolio) на Github.'**
  String get blogFooterDesc;

  /// No description provided for @blogFooterDesc2.
  ///
  /// In ru, this message translates to:
  /// **'Проект вдохновлен [репозиторием](https://github.com/filiph/filiphnet) Filip Hráček'**
  String get blogFooterDesc2;

  /// No description provided for @flourAndOrder.
  ///
  /// In ru, this message translates to:
  /// **'Мука и Порядок'**
  String get flourAndOrder;

  /// No description provided for @realtOne.
  ///
  /// In ru, this message translates to:
  /// **'Realt One'**
  String get realtOne;

  /// No description provided for @novex.
  ///
  /// In ru, this message translates to:
  /// **'Novex'**
  String get novex;

  /// No description provided for @flourAndOrderDesc.
  ///
  /// In ru, this message translates to:
  /// **' планировщик заказов для кондитеров'**
  String get flourAndOrderDesc;

  /// No description provided for @realtOneDesc.
  ///
  /// In ru, this message translates to:
  /// **' приложение для риэлторов'**
  String get realtOneDesc;

  /// No description provided for @novexDesc.
  ///
  /// In ru, this message translates to:
  /// **' E-comm приложение для сети хозяйственных магазинов'**
  String get novexDesc;

  /// No description provided for @aboutThisPage.
  ///
  /// In ru, this message translates to:
  /// **'Об этой странице'**
  String get aboutThisPage;

  /// No description provided for @socials.
  ///
  /// In ru, this message translates to:
  /// **'Соцсети'**
  String get socials;

  /// No description provided for @linkedin.
  ///
  /// In ru, this message translates to:
  /// **'[Linkedin](https://www.linkedin.com/in/bntsv/)'**
  String get linkedin;

  /// No description provided for @github.
  ///
  /// In ru, this message translates to:
  /// **'[Github](https://github.com/brntsv)'**
  String get github;

  /// No description provided for @telegram.
  ///
  /// In ru, this message translates to:
  /// **'[Telegram](https://t.me/bntsv)'**
  String get telegram;

  /// No description provided for @flourAndOrderDescriptionIntro.
  ///
  /// In ru, this message translates to:
  /// **'Планировщик заказов для кондитеров и пекарей'**
  String get flourAndOrderDescriptionIntro;

  /// No description provided for @flourAndOrderDescriptionItem1.
  ///
  /// In ru, this message translates to:
  /// **'Спроектировал MVP с нуля: выделил слои приложения, собрал подходящий стек пакетов и ui_kit, чтобы продукт было проще развивать дальше'**
  String get flourAndOrderDescriptionItem1;

  /// No description provided for @flourAndOrderDescriptionItem2.
  ///
  /// In ru, this message translates to:
  /// **'Обращал внимание на пробелы в ТЗ и UX-сценариях, уточнял требования с заказчиком и предлагал более удобные пользовательские потоки, закрывая пропущенные тесткейсы и снижая риск доработок на поздних этапах'**
  String get flourAndOrderDescriptionItem2;

  /// No description provided for @flourAndOrderDescriptionItem3.
  ///
  /// In ru, this message translates to:
  /// **'Настроил сборки и публикацию во все целевые магазины: App Store, Google Play, RuStore и AppGallery через скрипты на Makefile + fastlane'**
  String get flourAndOrderDescriptionItem3;

  /// No description provided for @flourAndOrderDescriptionItem4.
  ///
  /// In ru, this message translates to:
  /// **'Реализовал оплаты как через нативные шторки in_app_purchase, так и через WebView с ЮKassa, чтобы покрыть разные сценарии и платформенные ограничения'**
  String get flourAndOrderDescriptionItem4;

  /// No description provided for @flourAndOrderDescriptionItem5.
  ///
  /// In ru, this message translates to:
  /// **'Добавил контроль соединения на базе internet_connection_checker и собственного интерсептора, чтобы обрабатывать сетевые ошибки'**
  String get flourAndOrderDescriptionItem5;

  /// No description provided for @realtOneDescriptionIntro.
  ///
  /// In ru, this message translates to:
  /// **'Приложение для риэлторов, в данный момент работает с объектами в Новосибирске и в Москве'**
  String get realtOneDescriptionIntro;

  /// No description provided for @realtOneDescriptionItem1.
  ///
  /// In ru, this message translates to:
  /// **'С нуля спроектировал и собрал MVP: определил слои приложения и подобрал стек пакетов так, чтобы продукт было удобно развивать дальше'**
  String get realtOneDescriptionItem1;

  /// No description provided for @realtOneDescriptionItem2.
  ///
  /// In ru, this message translates to:
  /// **'Сформулировал требования к новому API и согласовал их с командой бэкенда, а также интегрировал несколько уже существующих API заказчика, приведя их к единому контракту и слою абстракций'**
  String get realtOneDescriptionItem2;

  /// No description provided for @realtOneDescriptionItem3.
  ///
  /// In ru, this message translates to:
  /// **'Реализовал ключевые фичи для работы с объектами: шахматку (срез дома), экран этажей и интерактивный генплан; и там, и там использовал CustomPainter — оверлеи строятся по координатам, которые присылает бэкенд'**
  String get realtOneDescriptionItem3;

  /// No description provided for @realtOneDescriptionItem4.
  ///
  /// In ru, this message translates to:
  /// **'Реализовал специфичный функционал под запросы заказчика: уведомления, сохранение базы клиентов, формирование заявок; чтобы несколько экранов реагировали на действия друг друга, настроил обмен событиями между BLoC’ами через собственную реализацию EventBus'**
  String get realtOneDescriptionItem4;

  /// No description provided for @novexDescriptionIntro.
  ///
  /// In ru, this message translates to:
  /// **'E-commerce приложение для сети хозяйственных магазинов в Сибири'**
  String get novexDescriptionIntro;

  /// No description provided for @novexDescriptionItem1.
  ///
  /// In ru, this message translates to:
  /// **'Повысил crash-free с ~59% до 99% (по данным AppMetrica), найдя и исправив критические баги, из‑за которых приложение падало у части пользователей'**
  String get novexDescriptionItem1;

  /// No description provided for @novexDescriptionItem2.
  ///
  /// In ru, this message translates to:
  /// **'Ускорил загрузку экранов за счёт оптимизации загрузки и кеширования изображений; подробнее о подходе в [статье](https://medium.com/make-android/save-your-memory-usage-by-optimizing-network-image-in-flutter-cbc9f8af47cd)'**
  String get novexDescriptionItem2;

  /// No description provided for @novexDescriptionItem3.
  ///
  /// In ru, this message translates to:
  /// **'Интегрировал SearchBooster, расширив возможности поиска по каталогу'**
  String get novexDescriptionItem3;

  /// No description provided for @novexDescriptionItem4.
  ///
  /// In ru, this message translates to:
  /// **'Настроил GitLab CI/CD, что сократило время выхода новых версий'**
  String get novexDescriptionItem4;

  /// No description provided for @novexDescriptionItem5.
  ///
  /// In ru, this message translates to:
  /// **'Работал над крупными фичами: редизайн ключевых экранов, новое отображение наличия товара, добавление новых способов доставки, голосовой поиск'**
  String get novexDescriptionItem5;

  /// No description provided for @novexDescriptionItem6.
  ///
  /// In ru, this message translates to:
  /// **'Добавил шиммер‑скелетоны, благодаря чему загрузка контента воспринимается быстрее'**
  String get novexDescriptionItem6;

  /// No description provided for @viewScreenshots.
  ///
  /// In ru, this message translates to:
  /// **'Смотреть скриншоты'**
  String get viewScreenshots;

  /// No description provided for @contributing.
  ///
  /// In ru, this message translates to:
  /// **'Contributing'**
  String get contributing;

  /// No description provided for @nativeWebscroll.
  ///
  /// In ru, this message translates to:
  /// **'[native_web_scroll](https://pub.dev/packages/native_web_scroll)'**
  String get nativeWebscroll;

  /// No description provided for @nativeWebscrollDesc.
  ///
  /// In ru, this message translates to:
  /// **'  нативный веб скролл для Flutter for Web'**
  String get nativeWebscrollDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
