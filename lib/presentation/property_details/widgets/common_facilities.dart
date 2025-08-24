import 'package:flutter/material.dart';

class CommonFacilities extends StatelessWidget {
  const CommonFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Common Facilities',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                'See All',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Facilities grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FacilityItem(
                icon: Icons.ac_unit,
                label: 'AC',
                colorScheme: colorScheme,
              ),
              FacilityItem(
                icon: Icons.restaurant,
                label: 'Restaurant',
                colorScheme: colorScheme,
              ),
              FacilityItem(
                icon: Icons.pool,
                label: 'Swimming Pool',
                colorScheme: colorScheme,
              ),
              FacilityItem(
                icon: Icons.support_agent,
                label: '24-Hours Front Desk',
                colorScheme: colorScheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;

  const FacilityItem({
    super.key,
    required this.icon,
    required this.label,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: colorScheme.onPrimary,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 64,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
