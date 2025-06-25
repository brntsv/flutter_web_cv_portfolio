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
  /// **'+7 999 450 32 85'**
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
  /// **'Имею опыт работы в команде как в офисе, так и удаленно. Интересуюсь лучшими практиками разработки мобильных приложений и применяю их в работе. Люблю разработку за её вызовы и необычные задачи, которые стимулируют не стоять на месте, постоянно развиваться и узнавать что-то новое. Участвовал в различных проектах: как в новых, запущенных с нуля в команде, так и в тех, что перешли к нам от других команд.'**
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

  /// No description provided for @nanAgencyPeriod.
  ///
  /// In ru, this message translates to:
  /// **'май. 2023 — наст. вр.'**
  String get nanAgencyPeriod;

  /// No description provided for @nanAgencyPosition.
  ///
  /// In ru, this message translates to:
  /// **'Flutter Developer в NaN Agency'**
  String get nanAgencyPosition;

  /// No description provided for @nanAgencyResponsibilities.
  ///
  /// In ru, this message translates to:
  /// **'Обязанности:'**
  String get nanAgencyResponsibilities;

  /// No description provided for @nanAgencyResponsibilityItem1.
  ///
  /// In ru, this message translates to:
  /// **'— Реализация фич по ТЗ;'**
  String get nanAgencyResponsibilityItem1;

  /// No description provided for @nanAgencyResponsibilityItem2.
  ///
  /// In ru, this message translates to:
  /// **'— Поддержка проектов - фикс багов, обновление версий фреймворка и пакетов;'**
  String get nanAgencyResponsibilityItem2;

  /// No description provided for @nanAgencyResponsibilityItem3.
  ///
  /// In ru, this message translates to:
  /// **'— Оценка задач по системе Позитивная - Реалистичная - Пессимистичная;'**
  String get nanAgencyResponsibilityItem3;

  /// No description provided for @nanAgencyResponsibilityItem4.
  ///
  /// In ru, this message translates to:
  /// **'— Рефакторинг проектов;'**
  String get nanAgencyResponsibilityItem4;

  /// No description provided for @nanAgencyResponsibilityItem5.
  ///
  /// In ru, this message translates to:
  /// **'— Выпуск релизов в Testflight, сборки app bundle и apk;'**
  String get nanAgencyResponsibilityItem5;

  /// No description provided for @nanAgencyResponsibilityItem6.
  ///
  /// In ru, this message translates to:
  /// **'— Настройка общих правил линтера для всех проектов.'**
  String get nanAgencyResponsibilityItem6;

  /// No description provided for @nanAgencyAchievements.
  ///
  /// In ru, this message translates to:
  /// **'Достижения:'**
  String get nanAgencyAchievements;

  /// No description provided for @nanAgencyAchievementItem1.
  ///
  /// In ru, this message translates to:
  /// **'— Настроил CI CD через гитлаб;'**
  String get nanAgencyAchievementItem1;

  /// No description provided for @nanAgencyAchievementItem2.
  ///
  /// In ru, this message translates to:
  /// **'— Интегрировал сервис Searchbooster в приложение;'**
  String get nanAgencyAchievementItem2;

  /// No description provided for @nanAgencyAchievementItem3.
  ///
  /// In ru, this message translates to:
  /// **'— Интегрировал сервис DaData в приложение;'**
  String get nanAgencyAchievementItem3;

  /// No description provided for @nanAgencyAchievementItem4.
  ///
  /// In ru, this message translates to:
  /// **'— Повысил производительность работы приложения путем задания размеров кеширования изображений;'**
  String get nanAgencyAchievementItem4;

  /// No description provided for @nanAgencyAchievementItem5.
  ///
  /// In ru, this message translates to:
  /// **'— Устранил креши приложения, профилировал приложение с помощью инструментов флаттера;'**
  String get nanAgencyAchievementItem5;

  /// No description provided for @nanAgencyAchievementItem6.
  ///
  /// In ru, this message translates to:
  /// **'— MVP приложения для риэлторов.'**
  String get nanAgencyAchievementItem6;

  /// No description provided for @nanAgencyProjects.
  ///
  /// In ru, this message translates to:
  /// **'Проекты, на которых работал продолжительное время:'**
  String get nanAgencyProjects;

  /// No description provided for @nanAgencyProjectsRealtOne.
  ///
  /// In ru, this message translates to:
  /// **'— Realt.One [Google Play](https://play.google.com/store/apps/details?id=com.realtone.realt_one&hl=RU) | [App Store](https://apps.apple.com/us/app/realt-one/id6742776096)'**
  String get nanAgencyProjectsRealtOne;

  /// No description provided for @nanAgencyProjectsNovex.
  ///
  /// In ru, this message translates to:
  /// **'— Novex [Google Play](https://play.google.com/store/apps/details?id=com.creonit.novex&hl=RU) | [App Store](https://apps.apple.com/ru/app/n%D0%BEvex-%D0%B4%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%B0%D0%BA%D1%86%D0%B8%D0%B8/id1608874837)'**
  String get nanAgencyProjectsNovex;

  /// No description provided for @skills.
  ///
  /// In ru, this message translates to:
  /// **'Навыки'**
  String get skills;

  /// No description provided for @skillsList.
  ///
  /// In ru, this message translates to:
  /// **'Dart Flutter bloc cubit dio retrofit auto_route rxdart Push Notifications AppLinks get_it injectable fastlane Makefile GitLab CI/CD geolocator geodesy fvm git'**
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

  /// No description provided for @interactivePortfolio.
  ///
  /// In ru, this message translates to:
  /// **'Интерактивное портфолио'**
  String get interactivePortfolio;

  /// No description provided for @counterText.
  ///
  /// In ru, this message translates to:
  /// **'Вы нажали на кнопку столько раз:'**
  String get counterText;

  /// No description provided for @increment.
  ///
  /// In ru, this message translates to:
  /// **'Увеличить'**
  String get increment;

  /// No description provided for @aboutMeBlog.
  ///
  /// In ru, this message translates to:
  /// **'Привет! Я Никита, Flutter разработчик. Работаю в аутсорс команде в Новосибирске. Стараюсь применять лучшие практики разработки, слежу за трендами и расширяю свой стек. Сейчас кроме Flutter интересуюсь Rust и Swift.'**
  String get aboutMeBlog;

  /// No description provided for @cv.
  ///
  /// In ru, this message translates to:
  /// **'Резюме'**
  String get cv;

  /// No description provided for @blogFooterDesc.
  ///
  /// In ru, this message translates to:
  /// **'Этот сайт создан на Flutter Web, серверная часть на Firebase. [Код доступен](https://github.com/brntsv/flutter_web_cv_portfolio) на Github.'**
  String get blogFooterDesc;

  /// No description provided for @blogFooterDesc2.
  ///
  /// In ru, this message translates to:
  /// **'Проект вдохновлен [репозиторием](https://github.com/filiph/filiphnet) Filip Hráček'**
  String get blogFooterDesc2;

  /// No description provided for @flourAndOrder.
  ///
  /// In ru, this message translates to:
  /// **'Мука и порядок'**
  String get flourAndOrder;

  /// No description provided for @realtOne.
  ///
  /// In ru, this message translates to:
  /// **'Realt.One'**
  String get realtOne;

  /// No description provided for @novex.
  ///
  /// In ru, this message translates to:
  /// **'Novex'**
  String get novex;

  /// No description provided for @flourAndOrderDesc.
  ///
  /// In ru, this message translates to:
  /// **' CRM-приложение для кондитеров'**
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
