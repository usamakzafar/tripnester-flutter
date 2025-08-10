import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/auth/sign_in_screen.dart';
import '../../presentation/auth/register_screen.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const SignInScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
      GoRoute(path: '/', builder: (_, __) => const _Home()),
    ],
  );
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(child: Text('Home - Welcome to TripNester!')),
  );
}
