import 'package:base_auth_app/src/presentation/screens/_screens.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (_, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AuthScreen.routeName,
      builder: (_, state) => const AuthScreen(),
    ),
  ],
);
