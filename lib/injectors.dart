import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'core/data/communication_impl.dart';
import 'core/data/communication_inferface.dart';
import 'core/enums/env.dart';
import 'core/injector/feature_injector.dart';
import 'features/home_page/home_injector.dart';
import 'features/new_note/new_note_injector.dart';

GetIt get getIt => GetIt.I;

class Injectors {
  static List<FeatureInjector> featureInjectors = [
    HomeInjector(),
    NewNoteInjector(),
  ];

  static void inject(Env env) {
    injectSingletons();

    for (var e in featureInjectors) {
      env == Env.prod ? e.injectDatasourcesImpl() : e.injectDatasourcesMock();
      e.inject();
    }
  }

  static void injectSingletons() {
    getIt.registerLazySingleton<CommunicationInterface>(
      () => CommunicationImpl(firebase: FirebaseFirestore.instance),
    );
  }
}
