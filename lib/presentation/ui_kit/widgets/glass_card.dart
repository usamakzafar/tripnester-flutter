import 'dart:ui';
import 'package:flutter/material.dart';

/// A reusable frosted-glass card component that's theme-aware and performant.
///
/// Uses backdrop blur with customizable tint color, border radius, and opacity
/// to create a modern glass-morphism effect.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
    this.blurSigma = 16,
    this.tintColor,
    this.borderOpacity = 0.18,
  });

  /// The widget to display inside the glass card
  final Widget child;

  /// Padding inside the card
  final EdgeInsetsGeometry padding;

  /// Border radius for rounded corners
  final double borderRadius;

  /// Blur intensity for the backdrop filter
  final double blurSigma;

  /// Tint color overlay. Defaults to theme surface color with opacity
  final Color? tintColor;

  /// Opacity of the border outline
  final double borderOpacity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveTintColor = tintColor ??
      colorScheme.surface.withValues(alpha: 0.65);

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurSigma,
            sigmaY: blurSigma,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: effectiveTintColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: borderOpacity),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 20,
                  color: Colors.black.withValues(alpha: 0.12),
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
