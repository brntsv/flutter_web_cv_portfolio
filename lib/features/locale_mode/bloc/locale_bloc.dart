import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/web.dart' as web;

part 'locale_event.dart';
part 'locale_state.dart';

/// {@template locale_bloc.class}
/// Блок для работы с языком
/// {@endtemplate}
final class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  /// {@macro locale_bloc.class}
  LocaleBloc() : super(const LocaleState(_defaultLocale)) {
    on<LoadLocale>(_onLoadLocale);
    on<ChangeLocale>(_onChangeLocale);

    // Загружаем сохраненную локаль при инициализации
    add(const LoadLocale());
  }

  static const _ru = 'ru';
  static const _en = 'en';
  static const _defaultLocale = Locale(_ru);
  static const _keyLocale = 'appLanguage';

  void _onLoadLocale(LoadLocale event, Emitter<LocaleState> emit) {
    try {
      final localStorage = web.window.localStorage;
      final savedLang = localStorage.getItem(_keyLocale);
      if (savedLang != null && (savedLang == _ru || savedLang == _en)) {
        emit(LocaleState(Locale(savedLang)));
      }
    } on Exception catch (_) {
      // Обработка исключений (например, если код запущен не в браузере)
    }
  }

  void _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) {
    try {
      web.window.localStorage.setItem(_keyLocale, event.locale.languageCode);
      emit(LocaleState(event.locale));
    } on Exception catch (_) {
      // Обработка исключений
      // Все равно меняем локаль в приложении, даже если не смогли сохранить
      emit(LocaleState(event.locale));
    }
  }
}
