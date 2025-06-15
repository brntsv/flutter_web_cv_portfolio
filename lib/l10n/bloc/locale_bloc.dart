import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/web.dart' as web;

part 'locale_event.dart';
part 'locale_state.dart';

/// Блок для работы с языком
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  /// {@macro locale_bloc.class}
  LocaleBloc() : super(const LocaleState(Locale('ru'))) {
    on<LoadLocale>(_onLoadLocale);
    on<ChangeLocale>(_onChangeLocale);

    // Загружаем сохраненную локаль при инициализации
    add(const LoadLocale());
  }

  void _onLoadLocale(LoadLocale event, Emitter<LocaleState> emit) {
    try {
      final localStorage = web.window.localStorage;
      final savedLang = localStorage.getItem('appLanguage');
      if (savedLang != null && (savedLang == 'ru' || savedLang == 'en')) {
        emit(LocaleState(Locale(savedLang)));
      }
    } on Exception catch (_) {
      // Обработка исключений (например, если код запущен не в браузере)
    }
  }

  void _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) {
    try {
      web.window.localStorage.setItem('appLanguage', event.locale.languageCode);
      emit(LocaleState(event.locale));
    } on Exception catch (_) {
      // Обработка исключений
      // Все равно меняем локаль в приложении, даже если не смогли сохранить
      emit(LocaleState(event.locale));
    }
  }
}
