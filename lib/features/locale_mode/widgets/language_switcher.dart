import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';

import '../bloc/locale_bloc.dart';

/// {@template language_switcher.class}
/// Переключатель языка
/// {@endtemplate}
class LanguageSwitcher extends StatelessWidget {
  /// {@macro language_switcher.class}
  const LanguageSwitcher({super.key});

  static const _ru = 'ru';
  static const _en = 'en';

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);
    final localeBloc = context.read<LocaleBloc>();
    return BlocSelector<LocaleBloc, LocaleState, Locale>(
      selector: (state) => state.locale,
      builder: (context, locale) {
        final isRussian = locale.languageCode == _ru;

        return Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: color.transparent,
              borderRadius: BorderRadius.circular(BaseConst.base8),
              border: Border(
                top: BorderSide(
                  color: color.darkGray,
                  width: BaseConst.base1_5,
                ),
                left: BorderSide(
                  color: color.darkGray,
                  width: BaseConst.base1_5,
                ),
                right: BorderSide(
                  color: color.darkGray,
                  width: BaseConst.base1_5,
                ),
                bottom: BorderSide(
                  color: color.darkGray,
                  width: BaseConst.base4,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                final newLocale = Locale(isRussian ? _en : _ru);
                localeBloc.add(ChangeLocale(newLocale));
              },
              borderRadius: BorderRadius.circular(BaseConst.base4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: BaseConst.base8,
                  vertical: BaseConst.base8,
                ),
                child: Text(
                  isRussian ? _en.toUpperCase() : _ru.toUpperCase(),
                  style: textStyle.baseTextBold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
