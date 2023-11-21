import '../../features/home_page/domain/entities/note.dart';
import '../authentication/firebase_helper.dart';
import '../../injectors.dart';
import 'app_navigator_interface.dart';
import 'routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_page/presentation/pages/home_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/new_note/presentation/pages/new_note_page.dart';

class AppNavigator implements AppNavigatorInterface {
  static FirebaseHelper firebaseHelper = getIt<FirebaseHelper>();

  static final List<GoRoute> routes = [
    GoRoute(
      path: Routes.home,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.noteDetail,
      builder: (_, state) {
        String? noteId;

        Object? extra = state.extra;

        if (extra is Note) {
          noteId = extra.id;
        }

        return NewNotePage(noteId: noteId);
      },
    ),
  ];

  static final router = GoRouter(
    initialLocation:
        firebaseHelper.isAuthenticate() ? Routes.home : Routes.login,
    routes: routes,
  );

  @override
  Future push<T>(String location, {Object? extra}) {
    return router.push<T>(location, extra: extra);
  }

  @override
  void pushReplacement<T>(String location, {Object? extra}) {
    router.pushReplacement(location, extra: extra);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    router.pop<T>(result);
  }
}
