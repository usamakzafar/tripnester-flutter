import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter() {
  // TODO(route): Add app routes/screens as they are implemented.
  return GoRouter(
    routes: [GoRoute(path: '/', builder: (_, __) => const _Hello())],
  );
}

class _Hello extends StatelessWidget {
  const _Hello();

  @override
  Widget build(BuildContext context) => const Directionality(
    textDirection: TextDirection.ltr,
    child: Center(child: Text('Hello TripNester')),
  );
}
