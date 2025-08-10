import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/autocomplete_result.dart';
import 'autocomplete_controller.dart';

/// AutocompleteController provider for managing autocomplete state.
/// Uses autoDispose to clean up resources when not in use.
final autocompleteControllerProvider =
    AsyncNotifierProvider.autoDispose<AutocompleteController, AutocompleteResult?>(
  () => AutocompleteController(),
);
