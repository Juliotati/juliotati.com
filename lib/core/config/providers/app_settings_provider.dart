import 'package:flutter/cupertino.dart';

class AppSettingsProvider with ChangeNotifier {
  String _languageCode = 'en';

  Locale get locale => Locale(_languageCode);

  void nextLanguage() {
    _languageCode = switch (_languageCode) {
      'en' => 'pt',
      'pt' => 'de',
      _ => 'en',
    };

    notifyListeners();
  }
}
