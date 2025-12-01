/// Миксин для работы с тайминговыми параметрами анимации текста
mixin BaseAnimationTimingMixin {
  /// Функция для получения класса анимации (1-20) для слова
  int getAnimationClass(int wordIndex, int baseClassNum) {
    // Создаем хеш, который даст распределение слов между классами
    final hashValue = (wordIndex * 17 + baseClassNum * 13) % 20;
    return hashValue + 1; // от 1 до 20
  }

  /// Получение параметров анимации для класса
  /// Аналог keyframes на filiph.net
  AnimationTiming getAnimationParams(int animationClass) =>
      switch (animationClass) {
        1 => const AnimationTiming(.03, .31),
        2 => const AnimationTiming(.04, .32),
        3 => const AnimationTiming(.05, .33),
        4 => const AnimationTiming(.06, .34),
        5 => const AnimationTiming(.07, .35),
        6 => const AnimationTiming(.08, .36),
        7 => const AnimationTiming(.09, .37),
        8 => const AnimationTiming(.10, .38),
        9 => const AnimationTiming(.11, .39),
        10 => const AnimationTiming(.12, .40),
        11 => const AnimationTiming(.13, .41),
        12 => const AnimationTiming(.14, .42),
        13 => const AnimationTiming(.15, .43),
        14 => const AnimationTiming(.16, .44),
        15 => const AnimationTiming(.17, .45),
        16 => const AnimationTiming(.18, .46),
        17 => const AnimationTiming(.19, .47),
        18 => const AnimationTiming(.20, .48),
        19 => const AnimationTiming(.21, .49),
        20 => const AnimationTiming(.22, .50),
        _ => const AnimationTiming(.10, .40),
      };
}

/// Класс для хранения начального и конечного времени анимации
class AnimationTiming {
  /// {@macro animation_timing.class}
  const AnimationTiming(this.startTime, this.endTime);

  /// Начальное время анимации
  final double startTime;

  /// Конечное время анимации
  final double endTime;
}
