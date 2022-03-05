import 'package:bloc_template/core/router/app_path.dart';
import 'package:bloc_template/features/auth/screen/auth_screen.dart';
import 'package:bloc_template/features/main/main_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
            name: AppPath.login.name,
            path: AppPath.login.path,
            builder: (context, state) => AuthScreen(),
            routes: [
              GoRoute(
                name: AppPath.home.name,
                path: AppPath.home.path,
                builder: (context, state) => MainScreen(),
              )
            ]),
      ]);
}
