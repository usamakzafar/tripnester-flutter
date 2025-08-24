import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'currency_config.dart';
import 'currency_provider.dart';

Future<void> changeAppCurrency(WidgetRef ref, SupportedCurrency next) async {
  await ref.read(currencyProvider.notifier).setCurrency(next);
}
