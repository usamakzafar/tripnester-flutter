import '../storage/secure_storage_interface.dart';
import 'dart:developer' as dev;

/// Supported residency countries in the app
enum SupportedResidency {
  us('US', 'United States'),
  gb('GB', 'United Kingdom'),
  de('DE', 'Germany'),
  fr('FR', 'France'),
  it('IT', 'Italy'),
  es('ES', 'Spain'),
  ca('CA', 'Canada'),
  au('AU', 'Australia');

  const SupportedResidency(this.code, this.displayName);

  final String code;
  final String displayName;

  static SupportedResidency fromCode(String code) {
    return SupportedResidency.values.firstWhere(
      (residency) => residency.code == code,
      orElse: () => SupportedResidency.es, // Default fallback
    );
  }
}

/// Residency configuration service
class ResidencyConfig {
  static const String _storageKey = 'selected_residency';
  static const SupportedResidency _defaultResidency = SupportedResidency.es;

  final SecureStorage _storage;

  const ResidencyConfig(this._storage);

  /// Get the current selected residency
  Future<SupportedResidency> getCurrentResidency() async {
    try {
      final storedCode = await _storage.read(_storageKey);
      if (storedCode != null) {
        return SupportedResidency.fromCode(storedCode);
      }
    } catch (e) {
      // If storage fails, return default
      dev.log('Failed to read residency from storage', name: 'ResidencyConfig', error: e);
    }
    return _defaultResidency;
  }

  /// Set the current residency (persists to storage)
  Future<void> setResidency(SupportedResidency residency) async {
    try {
      await _storage.write(_storageKey, residency.code);
    } catch (e) {
      dev.log('Failed to save residency to storage', name: 'ResidencyConfig', error: e);
      rethrow;
    }
  }

  /// Get the residency code as string (for API calls)
  Future<String> getResidencyCode() async {
    final residency = await getCurrentResidency();
    return residency.code;
  }

  /// Get the residency display name for UI
  Future<String> getResidencyDisplayName() async {
    final residency = await getCurrentResidency();
    return residency.displayName;
  }
}
