import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'currency_provider.dart';

String formatPrice(WidgetRef ref, num amount) {
  final c = ref.read(currencyProvider.notifier).currentOrDefault;
  return '${c.symbol} ${amount.toStringAsFixed(0)}';
}
