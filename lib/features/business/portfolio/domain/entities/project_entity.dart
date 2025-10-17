import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../enums/project_type.dart';

/// {@template project_entity.class}
/// Модель данных для одного проекта
/// {@endtemplate}
final class ProjectEntity extends Equatable {
  /// {@macro project_entity.class}
  const ProjectEntity({
    required this.appType,
    required this.screenshots,
  });

  /// Тип приложения
  final ProjectType appType;

  /// Скриншоты проекта
  final List<Widget> screenshots;

  @override
  List<Object?> get props => [
        appType,
        screenshots,
      ];
}
