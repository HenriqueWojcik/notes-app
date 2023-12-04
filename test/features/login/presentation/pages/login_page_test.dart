import 'package:flutter/material.dart';
import 'package:flutter_notes_app/core/navigator/app_navigator_impl.dart';
import 'package:flutter_notes_app/core/navigator/app_navigator_interface.dart';
import 'package:flutter_notes_app/core/navigator/routes.dart';
import 'package:flutter_notes_app/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_notes_app/features/login/presentation/pages/keys/login_keys.dart';
import 'package:flutter_notes_app/injectors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:my_foundation/main.dart';

import '../../../../mock/mocks.mocks.dart';

void main() {
  late Widget sut;
  late MockLoginController controller;
  late MockAppNavigatorInterface navigator;

  setUp(() {
    controller = MockLoginController();
    navigator = MockAppNavigatorInterface();

    getIt.registerFactory<LoginController>(() => controller);
    getIt.registerLazySingleton<AppNavigatorInterface>(() => navigator);

    sut = MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: Routes.login,
        routes: AppNavigator.routes,
      ),
    );
  });

  tearDown(() {
    getIt.reset();
  });

  void initState() {
    when(controller.scaffoldState).thenReturn(
      ScaffoldAppState(onSuccessMessage: ''),
    );
  }

  testWidgets('should load page corretly', (tester) async {
    initState();
    await tester.pumpWidget(sut);

    expect(find.byKey(LoginKeys.appName), findsOneWidget);
    expect(find.byKey(LoginKeys.loginWithGoogle), findsOneWidget);
  });

  testWidgets('should go home when login with google is success',
      (tester) async {
    initState();

    when(controller.login()).thenAnswer(
      (_) async => controller.scaffoldState
          .update(() async => await Future.value((null, null))),
    );

    await tester.pumpWidget(sut);

    await tester.tap(find.byKey(LoginKeys.loginWithGoogle));

    await tester.pump(const Duration(seconds: 1));

    verify(controller.login()).called(1);
    verify(navigator.pushReplacement(Routes.home)).called(1);
  });

  testWidgets('should call dispose when page closes', (tester) async {
    initState();

    await tester.pumpWidget(sut);

    await tester.pump();

    await tester.pumpWidget(Container());

    verify(controller.dispose()).called(1);
  });
}
