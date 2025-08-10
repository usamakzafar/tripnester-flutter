import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';

class TripNesterApp extends StatelessWidget {
  const TripNesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createAppRouter();
    return MaterialApp.router(
      title: 'TripNester',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
