part of 'locale_bloc.dart';

/// {@template locale_state.class}
/// Состояние языка
/// {@endtemplate}
final class LocaleState extends Equatable {
  /// {@macro locale_state.class}
  const LocaleState(this.locale);

  /// Язык
  final Locale locale;

  /// Является ли язык русским
  bool get isRu => locale.languageCode == 'ru';

  @override
  List<Object> get props => [locale];
}
