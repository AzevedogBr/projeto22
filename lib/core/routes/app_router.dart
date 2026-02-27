import 'package:go_router/go_router.dart';
import 'package:projeto22/presentation/home/pages/home_page.dart';
import 'package:projeto22/presentation/login/pages/login_page.dart';
import 'package:projeto22/presentation/splash/pages/splash_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
