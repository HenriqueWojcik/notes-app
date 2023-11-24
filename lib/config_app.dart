import 'package:intl/intl.dart';

import 'core/authentication/firebase_helper.dart';
import 'core/enums/env.dart';
import 'core/i18n/i18n.dart';
import 'injectors.dart';

class ConfigApp {
  static bool configDone = false;

  static Future<void> onInit() async {
    if (configDone) return;

    Injectors.inject(Env.mock);
    I18n.load(
      Intl.getCurrentLocale(),
    );
    await FirebaseHelper.init();
    configDone = true;
  }
}
