import 'dart:developer' as dev;
import '../storage/secure_storage_interface.dart';

/// Supported currencies in the app
enum SupportedCurrency {
  eur('EUR', '€'),
  usd('USD', '\$'),
  gbp('GBP', '£');

  const SupportedCurrency(this.code, this.symbol);

  final String code;
  final String symbol;

  static SupportedCurrency fromCode(String code) {
    return SupportedCurrency.values.firstWhere(
      (currency) => currency.code == code,
      orElse: () => SupportedCurrency.eur, // Default fallback
    );
  }
}

/// Currency configuration service
class CurrencyConfig {
  static const String _storageKey = 'selected_currency';
  static const SupportedCurrency _defaultCurrency = SupportedCurrency.eur;

  final SecureStorage _storage;

  const CurrencyConfig(this._storage);

  /// Get the current selected currency
  Future<SupportedCurrency> getCurrentCurrency() async {
    try {
      final storedCode = await _storage.read(_storageKey);
      if (storedCode != null) {
        return SupportedCurrency.fromCode(storedCode);
      }
    } catch (e) {
      // If storage fails, return default
      dev.log('Failed to read currency from storage', name: 'CurrencyConfig', error: e);
    }
    return _defaultCurrency;
  }

  /// Set the current currency (persists to storage)
  Future<void> setCurrency(SupportedCurrency currency) async {
    try {
      await _storage.write(_storageKey, currency.code);
    } catch (e) {
      dev.log('Failed to save currency to storage', name: 'CurrencyConfig', error: e);
      rethrow;
    }
  }

  /// Get the currency code as string (for API calls)
  Future<String> getCurrencyCode() async {
    final currency = await getCurrentCurrency();
    return currency.code;
  }

  /// Get the currency symbol for UI display
  Future<String> getCurrencySymbol() async {
    final currency = await getCurrentCurrency();
    return currency.symbol;
  }
}
