import 'dart:async';
import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

/// Помощник для работы с URL
class UrlLauncher {
  /// Открытие url по умолчанию
  static Future<bool> openUrl(
    String formatted,
  ) async {
    final uri = Uri.parse(formatted);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      return true;
    } on Exception catch (e, s) {
      log('Could not launch $formatted', error: e, stackTrace: s);
      return false;
    }
  }
}
