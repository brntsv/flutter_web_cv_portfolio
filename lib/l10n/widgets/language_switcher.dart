import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/l10n/bloc/locale_bloc.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final localeBloc = context.read<LocaleBloc>();
    return BlocSelector<LocaleBloc, LocaleState, Locale>(
      selector: (state) => state.locale,
      builder: (context, locale) {
        final isRussian = locale.languageCode == 'ru';

        return Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          child: InkWell(
            onTap: () {
              final newLocale = isRussian
                  ? const Locale('en')
                  : const Locale('ru');
                  
              localeBloc.add(ChangeLocale(newLocale));
            },
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                isRussian ? 'EN' : 'RU',
                style: const TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
