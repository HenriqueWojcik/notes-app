import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/core/enums/home_view.dart';
import 'package:flutter_notes_app/core/navigator/app_navigator_impl.dart';
import 'package:flutter_notes_app/core/navigator/app_navigator_interface.dart';
import 'package:flutter_notes_app/core/navigator/routes.dart';
import 'package:flutter_notes_app/core/state/app_state.dart';
import 'package:flutter_notes_app/features/home_page/domain/entities/note.dart';
import 'package:flutter_notes_app/features/home_page/presentation/controller/home_controller.dart';
import 'package:flutter_notes_app/features/home_page/presentation/pages/keys/home_keys.dart';
import 'package:flutter_notes_app/injectors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/mocks.mocks.dart';
import '../../../../samples/entities/note_model_sample.dart';

void main() {
  late Widget sut;
  late MockHomeController controller;
  late MockAppNavigatorInterface navigator;
  late MockUser user;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    controller = MockHomeController();
    navigator = MockAppNavigatorInterface();
    user = MockUser();

    getIt.registerFactory<HomeController>(() => controller);
    getIt.registerLazySingleton<AppNavigatorInterface>(() => navigator);
    getIt.registerLazySingleton<User>(() => user);

    sut = MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: Routes.home,
        routes: AppNavigator.routes,
      ),
    );
  });

  tearDown(() {
    getIt.reset();
  });

  void initStates() {
    final notes = AppState<List<Note>>();
    notes.value = [NoteSample.sample(), NoteSample.sample()];

    final homeView = AppState<HomeView>();
    homeView.value = HomeView.list;

    when(user.photoURL).thenReturn('photoUrl');
    when(controller.notes).thenReturn(notes);
    when(controller.homeView).thenReturn(homeView);
  }

  testWidgets('should open new note page when fab is clicked', (tester) async {
    initStates();

    when(navigator.push(any)).thenAnswer((_) async => true);
    when(navigator.pop()).thenAnswer((_) async => true);

    await tester.pumpWidget(sut);

    final button = find.byKey(HomeKeys.floatingButton);
    await tester.tap(button);

    verify(navigator.push(any)).called(1);
    verify(controller.update(refresh: true)).called(1);
  });

  testWidgets(
      'should call method to change homeview in controller when icon is clicked',
      (tester) async {
    initStates();

    await tester.pumpWidget(sut);

    final button = find.byKey(HomeKeys.homeViewTypeIcon);
    await tester.tap(button);

    verify(controller.changeHomeViewState()).called(1);
  });

  testWidgets('should pass the correct value when fetching a value in notes',
      (tester) async {
    const String value = 'note';
    initStates();

    await tester.pumpWidget(sut);

    final textField = find.byKey(HomeKeys.textFieldSearch);
    await tester.enterText(textField, value);

    verify(controller.onSearchNotes(value)).called(1);
  });

  testWidgets('should load notes list correctly ', (tester) async {
    initStates();

    await tester.pumpWidget(sut);

    await tester.pump();

    expect(find.byKey(HomeKeys.floatingButton), findsOneWidget);
    expect(find.byKey(HomeKeys.notesList), findsOneWidget);
  });

  testWidgets('should navigate to new note page when note is clicked',
      (tester) async {
    initStates();

    final Note note = controller.notes.data!.first;

    when(navigator.push(any, extra: note)).thenAnswer((_) async => true);
    when(navigator.pop()).thenAnswer((_) async => true);

    await tester.pumpWidget(sut);

    final item = find.byKey(HomeKeys.noteCard(id: note.id));
    await tester.tap(item);

    await tester.pump();

    verify(navigator.push(any, extra: note)).called(1);
  });

  testWidgets('should call dispose when page closes', (tester) async {
    initStates();

    await tester.pumpWidget(sut);

    await tester.pump();

    await tester.pumpWidget(Container());

    verify(controller.dispose()).called(1);
  });
}
