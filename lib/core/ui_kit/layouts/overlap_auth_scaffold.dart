import 'package:flutter/material.dart';

/// A reusable scaffold layout for authentication screens featuring a green top section
/// with an overlapping rounded card containing form content.
class OverlapAuthScaffold extends StatelessWidget {
  const OverlapAuthScaffold({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.logoAsset,
    this.topHeightFraction = 0.30,
    this.cardPadding = const EdgeInsets.all(20),
    this.cardMargin,
  });

  /// Main title displayed in the green section
  final String title;

  /// Optional subtitle displayed below the title
  final String? subtitle;

  /// Logo asset path, defaults to 'assets/images/logo.png' if null
  final String? logoAsset;

  /// The form content to display inside the card
  final Widget child;

  /// Fraction of screen height for the top green section (default 0.30)
  final double topHeightFraction;

  /// Padding inside the card (default EdgeInsets.all(20))
  final EdgeInsetsGeometry cardPadding;

  /// Margin around the card, if null uses default overlap positioning
  final EdgeInsetsGeometry? cardMargin;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final topHeight = constraints.maxHeight * topHeightFraction;
            final effectiveCardMargin = cardMargin ??
                EdgeInsets.fromLTRB(16, topHeight - 40, 16, 16);

            return Stack(
              children: [
                // Top green section
                Container(
                  height: topHeight,
                  width: double.infinity,
                  color: colorScheme.primary,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo
                        if (logoAsset != null || logoAsset == null) ...[
                          Image.asset(
                            logoAsset ?? 'assets/images/logos/logo-white.png',
                            height: 48,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.hotel,
                              size: 48,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        // Title
                        Text(
                          title,
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Optional subtitle
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // Overlapping form card
                AnimatedPadding(
                  duration: const Duration(milliseconds: 150),
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Container(
                          margin: effectiveCardMargin,
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 16,
                                offset: Offset(0, 8),
                                color: Color(0x1A000000),
                              ),
                            ],
                          ),
                          padding: cardPadding,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
