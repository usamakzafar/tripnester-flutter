import 'package:flutter/material.dart';
import 'recent_searches_section.dart';
import 'recently_viewed_section.dart';

class StaticSearchWidgets extends StatelessWidget {
  const StaticSearchWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        RecentSearchesSection(),
        SizedBox(height: 30),
        RecentlyViewedSection(),
        SizedBox(height: 24),
      ],
    );
  }
}

