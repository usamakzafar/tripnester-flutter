import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'currency_config.dart';
import '../storage/secure_storage.dart';
import '../storage/secure_storage_interface.dart';

/// Notifier for managing currency state
class CurrencyNotifier extends AsyncNotifier<SupportedCurrency> {
  late final CurrencyConfig _currencyConfig;

  @override
  Future<SupportedCurrency> build() async {
    _currencyConfig = ref.read(currencyConfigProvider);
    return await _currencyConfig.getCurrentCurrency();
  }

  /// Update the selected currency
  Future<void> setCurrency(SupportedCurrency currency) async {
    state = const AsyncValue.loading();
    try {
      await _currencyConfig.setCurrency(currency);
      state = AsyncValue.data(currency);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      // Do NOT rethrow to avoid crashing upstream
    }
  }

  /// Get currency code for API calls
  String get currencyCode {
    return state.valueOrNull?.code ?? SupportedCurrency.eur.code;
  }

  /// Get currency symbol for UI display
  String get currencySymbol {
    return state.valueOrNull?.symbol ?? SupportedCurrency.eur.symbol;
  }

  /// Synchronous fallback helper
  SupportedCurrency get currentOrDefault => state.valueOrNull ?? SupportedCurrency.eur;
}

/// Provider for generic SecureStorage interface
final secureStorageInterfaceProvider = Provider<SecureStorage>((ref) {
  final flutterStorage = ref.read(secureStorageProvider);
  return SecureStorageImpl(flutterStorage);
});

/// Provider for CurrencyConfig service
final currencyConfigProvider = Provider<CurrencyConfig>((ref) {
  final storage = ref.read(secureStorageInterfaceProvider);
  return CurrencyConfig(storage);
});

/// Provider for currency state management
final currencyProvider = AsyncNotifierProvider<CurrencyNotifier, SupportedCurrency>(() {
  return CurrencyNotifier();
});
