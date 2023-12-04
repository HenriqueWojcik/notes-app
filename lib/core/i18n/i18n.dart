import 'package:my_foundation/main.dart';
import 'strings/en_us.dart';
import 'strings/pt_br.dart';

import 'translations.dart';

class I18n {
  static Translations strings = PtBr();

  static void load(String locale) {
    debugPrint(locale);
    if (locale == 'pt_BR') {
      strings = PtBr();
    }

    strings = EnUs();
  }
}
