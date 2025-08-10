import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../di/injection_container.dart';

/// Session initialization provider that hydrates tokens on app startup.
final sessionInitProvider = FutureProvider<void>((ref) async {
  await ref.read(tokenStoreProvider.notifier).hydrate();
});
