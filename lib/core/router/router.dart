import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/home_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/login_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/sign_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

final _router = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified) {
          return LoginPage.routPath;
        }
        return null;
      },
    ),
    GoRoute(
      path: LoginPage.routPath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignPage.routPath,
      builder: (context, state) => const SignPage(),
    ),
  ],
);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
