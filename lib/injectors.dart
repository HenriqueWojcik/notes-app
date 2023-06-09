import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/data/communication_impl.dart';
import 'core/data/communication_inferface.dart';
import 'core/enums/env.dart';
import 'core/injector/feature_injector.dart';
import 'features/home_page/home_injector.dart';
import 'features/login/login_injector.dart';
import 'features/new_note/new_note_injector.dart';
import 'firebase_helper.dart';

GetIt get getIt => GetIt.I;

class Injectors {
  static List<FeatureInjector> featureInjectors = [
    LoginInjector(),
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

    getIt.registerLazySingleton(
      () => FirebaseHelper(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(),
      ),
    );
  }

  static void registerUser(User user) {
    getIt.registerLazySingleton<User>(() => user);
  }
}
