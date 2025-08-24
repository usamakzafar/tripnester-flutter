import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'currency_provider.dart';
import 'residency_config.dart';
import '../storage/secure_storage.dart';
import '../storage/secure_storage_interface.dart';

/// Notifier for managing residency state
class ResidencyNotifier extends AsyncNotifier<SupportedResidency> {
  late final ResidencyConfig _residencyConfig;

  @override
  Future<SupportedResidency> build() async {
    _residencyConfig = ref.read(residencyConfigProvider);
    return await _residencyConfig.getCurrentResidency();
  }

  /// Update the selected residency
  Future<void> setResidency(SupportedResidency residency) async {
    state = const AsyncValue.loading();
    try {
      await _residencyConfig.setResidency(residency);
      state = AsyncValue.data(residency);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      // Do NOT rethrow to avoid crashing upstream
    }
  }

  /// Get residency code for API calls
  String get residencyCode {
    return state.valueOrNull?.code ?? SupportedResidency.us.code;
  }

  /// Get residency display name for UI
  String get residencyDisplayName {
    return state.valueOrNull?.displayName ?? SupportedResidency.us.displayName;
  }

  /// Synchronous fallback helper
  SupportedResidency get currentOrDefault => state.valueOrNull ?? SupportedResidency.us;
}

/// Provider for ResidencyConfig service
final residencyConfigProvider = Provider<ResidencyConfig>((ref) {
  final storage = ref.read(secureStorageInterfaceProvider);
  return ResidencyConfig(storage);
});

/// Provider for residency state management
final residencyProvider = AsyncNotifierProvider<ResidencyNotifier, SupportedResidency>(() {
  return ResidencyNotifier();
});
