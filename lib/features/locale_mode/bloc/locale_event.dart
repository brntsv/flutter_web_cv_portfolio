part of 'locale_bloc.dart';

/// События для блока языка
sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

/// Событие для загрузки языка
final class LoadLocale extends LocaleEvent {
  /// Событие для загрузки языка
  const LoadLocale();
}

/// Событие для изменения языка
final class ChangeLocale extends LocaleEvent {
  /// Событие для изменения языка
  const ChangeLocale(this.locale);

  /// Язык
  final Locale locale;

  @override
  List<Object> get props => [locale];
}
