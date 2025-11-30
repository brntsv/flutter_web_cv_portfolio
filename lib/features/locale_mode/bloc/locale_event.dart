part of 'locale_bloc.dart';

/// {@template locale_event.class}
/// События для блока языка
/// {@endtemplate}
sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

/// {@template load_locale.class}
/// Событие для загрузки языка
/// {@endtemplate}
final class LoadLocale extends LocaleEvent {
  /// {@macro load_locale.class}
  const LoadLocale();
}

/// {@template change_locale.class}
/// Событие для изменения языка
/// {@endtemplate}
final class ChangeLocale extends LocaleEvent {
  /// {@macro change_locale.class}
  const ChangeLocale(this.locale);

  /// Язык
  final Locale locale;

  @override
  List<Object> get props => [locale];
}
