import '../../features/home_page/domain/entities/note.dart';
import '../../firebase_helper.dart';
import '../../injectors.dart';
import 'routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_page/presentation/pages/home_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/new_note/presentation/pages/new_note_page.dart';

class AppNavigator {
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
    )
  ];

  static final router = GoRouter(
    initialLocation:
        firebaseHelper.isAuthenticate() ? Routes.home : Routes.login,
    routes: routes,
  );
}
