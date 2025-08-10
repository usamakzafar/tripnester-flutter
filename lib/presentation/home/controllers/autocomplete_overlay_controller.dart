import 'package:flutter/material.dart';

/// A utility controller that manages an OverlayEntry lifecycle for showing/hiding
/// popup content positioned relative to an anchor widget.
class AutocompleteOverlayController {
  OverlayEntry? _entry;

  /// Shows the overlay with the given child widget positioned below the anchor rect.
  void show({
    required BuildContext context,
    required Rect anchorRect,
    required Widget child,
  }) {
    // Hide any existing overlay first
    hide();

    _entry = OverlayEntry(
      builder: (context) => Positioned(
        top: anchorRect.bottom,
        left: anchorRect.left,
        width: anchorRect.width,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: child,
        ),
      ),
    );

    Overlay.of(context).insert(_entry!);
  }

  /// Hides the overlay by removing and nulling the entry.
  void hide() {
    _entry?.remove();
    _entry = null;
  }

  /// Returns whether the overlay is currently shown.
  bool get isShown => _entry != null;
}
